import 'package:flutter/material.dart';

class PhotoDetailsScreen extends StatefulWidget {
  final String url;
  final String title;
  final int id;

  const PhotoDetailsScreen(this.url, this.title, this.id, {super.key});

  @override
  State<PhotoDetailsScreen> createState() => _PhotoDetailsScreenState();
}

class _PhotoDetailsScreenState extends State<PhotoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Photo Details'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(
                flex: 5,
              ),
              SizedBox(
                child: Image.network(widget.url),
              ),
              const Spacer(
                flex: 1,
              ),
              Text("Title: ${widget.title}"),
              Text("ID: ${widget.id}"),
              const Spacer(
                flex: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}