import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/storage/sql_database_manager.dart';
import '../../../utils/error_handler.dart';
import '../models/entry.dart';

class EntryController extends GetxController {
  var entries = <Entry>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllEntries();
  }

  final SQLDatabaseManager sqlDatabaseManager = SQLDatabaseManager();

  saveEntry(Entry entry) async {
    try {
      log("Saving Entry: ${entry.toMap()}");
      log("Images Before Saving: ${entry.imagePaths}");
      await sqlDatabaseManager.insertEntry(entry);
      getAllEntries(); // Refresh entries after saving
    } catch (e) {
      ErrorHandler.show(e.toString());
    }
  }

  deleteEntry(int id) async {
    try {
      await sqlDatabaseManager.deleteEntry(id);
    } catch (e) {
      ErrorHandler.show(e.toString());
    } finally {
      getAllEntries();
    }
  }

  deleteEntries() async {
    try {
      await sqlDatabaseManager.deleteEntries();
    } catch (e) {
      ErrorHandler.show(e.toString());
    } finally {
      getAllEntries();
    }
  }

  getAllEntries() async {
    List<Entry> entries_ = [];
    Map<int, Entry> entriesMap = {};
    try {
      final List<Map<String, dynamic>> data =
          await sqlDatabaseManager.getEntries();
      log("Raw DB Data: $data");

      for (var entry in data) {
        log(entry['image'].toString());
        int entryId = entry['id'];

        if (!entriesMap.containsKey(entryId)) {
          entriesMap[entryId] = Entry.fromMap(entry);
        }

        if (entry['image'].toString() != '') {
          log("Adding image ${entry['image']} to entry ID: $entryId");
          entriesMap[entryId]!.imagePaths.add(entry['image'].toString());
        }
      }
      entries_ = entriesMap.values.toList();
      log(entriesMap.toString());
      log("Final Entries List: $entries_");
      entries(entries_);
    } catch (e) {
      ErrorHandler.show(e.toString());
    }
  }
}
