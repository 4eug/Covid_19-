import 'package:covid_19/models/coronainfo.dart';
import 'package:covid_19/services/api.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  Future<CoronaModel> _coronaModel;

  @override
  void initState() {
    _coronaModel = Corona_api().getCorona();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Covid-19 Update')),
      ),
      body: Container(
        child: FutureBuilder<CoronaModel>(
            future: _coronaModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    // ignore: unused_local_variable
                    var active = snapshot.data.cases;
                    return Container(
                      height: 100,
                      child: Row(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                  ),
                                  Center(
                                    child: Text(
                                      'Total Cases: $_coronaModel',
                                      style: TextStyle(fontSize: 24.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  gridDelegate: null,
                );
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
