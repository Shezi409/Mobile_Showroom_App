import 'package:flutter/material.dart';

import 'get_data_service.dart';

class GetDataView extends StatelessWidget with GetDataService {
  GetDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Welcome to\n Career Baba",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                MaterialButton(
                  onPressed: () {
                    getColleciton();
                  },
                  height: 54,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: const Text("Get Collection"),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    getSingleDocumentData();
                  },
                  height: 54,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: const Text("Get Single DOcument"),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () async {
                    onConnectRealtime();
                  },
                  height: 54,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: const Text("Connect Realtime"),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () async {
                    deleteDoc();
                  },
                  height: 54,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: const Text("deleteDoc"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
