import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const EditScreen());

  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final CollectionReference _note =
      FirebaseFirestore.instance.collection('note');

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _titleController.text = documentSnapshot['title'];
      _descriptionController.text = documentSnapshot['description'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'title'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? title = _titleController.text;
                    final String? description = _descriptionController.text;

                    if (title != null && description != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _note
                            .add({"title": title, "description": description});
                      }

                      if (action == 'update') {
                        // Update the product
                        await _note.doc(documentSnapshot!.id).update(
                            {"title": title, "description": description});
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String productId) async {
    await _note.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Note deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Edit and delete note '),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder(
        stream: _note.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['Type the title here']),
                    subtitle: Text(documentSnapshot['Type the description']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          // Press this button to edit a single product
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          // This icon button is used to delete a single product
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteProduct(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
