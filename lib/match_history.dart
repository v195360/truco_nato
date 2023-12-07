import 'package:flutter/material.dart';
import 'package:truco_nato/add_match.dart';
import 'package:truco_nato/model/match_detail.dart';
import 'package:truco_nato/model/matches.dart';
import 'package:truco_nato/provider/firebase_firestore.dart';

class MatchHistory extends StatefulWidget {
  @override
  _MatchHistoryState createState() => _MatchHistoryState();
}

class _MatchHistoryState extends State<MatchHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match History'),
      ),
      body: FutureBuilder(
        future: _fetchMatchHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (snapshot.data != null) {
              MatchCollection matchCollection = snapshot.data!;
              return _buildMatchList(matchCollection);
            } else {
              // Handle the case when data is null
              return CircularProgressIndicator(); // Or any other loading/error widget
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddMatch()));
        },
        child: Icon(Icons.interests_rounded), // Replace with your desired icon
        backgroundColor:
            Colors.black, // Customize the button's background color
      ),
    );
  }

  Future<MatchCollection> _fetchMatchHistory() async {
    // Fetch match history from Firestore
    FirestoreDatabase database = FirestoreDatabase.helper;
    return await database.getMatchList();
  }

  Widget _buildMatchList(MatchCollection matchCollection) {
    print("Match Collection Length: ${matchCollection.length()}");
    print("Match Collection: ${matchCollection.matchList}");
    // Build the UI to display the list of matches
    return ListView.builder(
      itemCount: matchCollection.length(),
      itemBuilder: (context, index) {
        MatchDetail match = matchCollection.getMatchAtIndex(index);
        return ListTile(
          title: Text('Opponent: ${match.oponente}'),
          subtitle: Text('Result: ${match.resultado}'),
          // Add more details as needed
        );
      },
    );
  }
}
