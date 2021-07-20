import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:housy_2task/utils/get_movie_data.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  late final dynamic _movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('movies'),
        ),
        body: FutureBuilder<List>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.arrow_upward),
                                        Text(snapshot.data!
                                            .elementAt(index)['voting']
                                            .toString()),
                                        Icon(Icons.arrow_downward),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(snapshot.data!
                                                .elementAt(index)['poster']))),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!
                                              .elementAt(index)['title']
                                              .toString(),
                                          style:
                                              const TextStyle(fontSize: 20.0),
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text: 'Genre: ',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                children: [
                                              TextSpan(
                                                  text: snapshot.data!
                                                      .elementAt(index)['genre']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14))
                                            ])),
                                        RichText(
                                            text: TextSpan(
                                                text: 'Director: ',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                children: [
                                              TextSpan(
                                                  text: snapshot.data!
                                                      .elementAt(
                                                          index)['director'][0]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14))
                                            ])),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: RichText(
                                              text: TextSpan(
                                                  text: 'Starring: ',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  children: [
                                                TextSpan(
                                                    text: snapshot.data!
                                                        .elementAt(
                                                            index)['stars'][0]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14))
                                              ])),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: RichText(
                                              text: TextSpan(
                                                  text: 'Language: ',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  children: [
                                                TextSpan(
                                                    text: snapshot.data!
                                                        .elementAt(
                                                            index)['language']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14))
                                              ])),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: RichText(
                                              text: TextSpan(
                                                  text: 'Views: ',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  children: [
                                                TextSpan(
                                                    text: snapshot.data!
                                                        .elementAt(
                                                            index)['pageViews']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14))
                                              ])),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: RichText(
                                              text: TextSpan(
                                                  text: 'Starring: ',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  children: [
                                                TextSpan(
                                                    text: snapshot.data!
                                                        .elementAt(
                                                            index)['stars'][0]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14))
                                              ])),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: RichText(
                                              text: TextSpan(
                                                  text: 'Language: ',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  children: [
                                                TextSpan(
                                                    text: snapshot.data!
                                                        .elementAt(
                                                            index)['language']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14))
                                              ])),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: RichText(
                                              text: TextSpan(
                                                  text: 'Release Date: ',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  children: [
                                                TextSpan(
                                                    text: DateTime.parse(
                                                            DateTime.fromMicrosecondsSinceEpoch(snapshot
                                                                        .data!
                                                                        .elementAt(
                                                                            index)[
                                                                    'releasedDate'])
                                                                .toString())
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14))
                                              ])),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text('Watch Trailer')),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ));
            }
          },
          future: getData(),
        ));
  }
}
