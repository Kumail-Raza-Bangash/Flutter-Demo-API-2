import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserDetails> userDetails = [];
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  
  Future <List<userDetails>> getData() async {
    final response = await http.get(Uri.parse('ff'));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      userDetails.add(UserDetails.fromJson(index));
    }
    return userDetails;
    else{
      return userDetails;

    }
  }
}