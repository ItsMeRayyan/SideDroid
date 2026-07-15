import 'package:flutter/material.dart';

import '../models/repository.dart';
import '../services/repository_api.dart';
import '../widgets/repository_card.dart';


class RepositoriesPage extends StatefulWidget {

  const RepositoriesPage({
    super.key,
  });


  @override
  State<RepositoriesPage> createState() =>
      _RepositoriesPageState();

}



class _RepositoriesPageState
    extends State<RepositoriesPage> {


  late Future<List<Repository>> repositories;



  @override
  void initState() {

    super.initState();

    repositories =
        RepositoryApi.getRepositories();

  }



  void refreshRepositories() {

    setState(() {

      repositories =
          RepositoryApi.getRepositories();

    });

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Repositories",
        ),


        actions: [

          IconButton(

            icon: const Icon(
              Icons.refresh,
            ),


            onPressed:
                refreshRepositories,

          ),

        ],

      ),



      body: FutureBuilder<List<Repository>>(

        future: repositories,


        builder: (context, snapshot) {


          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(

              child:
                  CircularProgressIndicator(),

            );

          }



          if (snapshot.hasError) {

            return Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,


                children: [

                  const Icon(
                    Icons.error_outline,
                    size: 48,
                  ),


                  const SizedBox(
                    height: 12,
                  ),


                  Text(
                    "Error: ${snapshot.error}",
                  ),


                  const SizedBox(
                    height: 12,
                  ),


                  ElevatedButton(

                    onPressed:
                        refreshRepositories,


                    child: const Text(
                      "Retry",
                    ),

                  ),

                ],

              ),

            );

          }



          final list =
              snapshot.data ?? [];



          if (list.isEmpty) {

            return const Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,


                children: [

                  Icon(
                    Icons.library_books,
                    size: 64,
                  ),


                  SizedBox(
                    height: 12,
                  ),


                  Text(
                    "No repositories added",
                  ),

                ],

              ),

            );

          }



          return RefreshIndicator(

            onRefresh: () async {

              refreshRepositories();

            },


            child: ListView.builder(

              padding:
                  const EdgeInsets.all(12),


              itemCount:
                  list.length,


              itemBuilder:
                  (context, index) {


                return Padding(

                  padding:
                      const EdgeInsets.only(
                        bottom: 12,
                      ),


                  child: RepositoryCard(

                    repository:
                        list[index],

                  ),

                );

              },

            ),

          );

        },

      ),

    );

  }

}