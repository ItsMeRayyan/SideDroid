import 'package:flutter/material.dart';

import '../models/repository.dart';


class RepositoryCard extends StatelessWidget {

  final Repository repository;


  const RepositoryCard({
    super.key,
    required this.repository,
  });


  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        leading: Icon(
          repository.trusted
              ? Icons.verified
              : Icons.link,
        ),


        title: Text(
          repository.name,
        ),


        subtitle: Text(
          repository.description,
        ),


        trailing: repository.trusted
            ? const Text(
                "Trusted",
              )
            : const Text(
                "Custom",
              ),

      ),

    );

  }

}