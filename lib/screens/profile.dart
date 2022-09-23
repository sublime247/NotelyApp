import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8EEE2),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'NOTELY',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                    radius: 80,
                    backgroundImage: Image.asset('assets/profile.png').image,
                    backgroundColor: Color(0XFFE5D5C5)),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  'Shambhavi Mishra',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  'Lucknow, India',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(Icons.perm_identity,
                                  color: Color(0xFFD9614C)),
                            )),
                        title: const Text(
                          'Buy Premium',
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF595550),
                          size: 20,
                        ),
                      ),
                      ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child:
                                  Icon(Icons.edit, color: Color(0xFFD9614C)),
                            )),
                        title: const Text('Edit Profile'),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF595550), size: 20),
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.toggle_on,
                                color: Color(0xFFD9614C)),
                          ),
                        ),
                        title: const Text('App Theme'),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF595550), size: 20),
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.notifications,
                                color: Color(0xFFD9614C)),
                          ),
                        ),
                        title: const Text('Notifications'),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF595550), size: 20),
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.folder_copy,
                                color: Color(0xFFD9614C)),
                          ),
                        ),
                        title: const Text('Security'),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF595550), size: 20),
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child:
                                Icon(Icons.logout, color: Color(0xFFD9614C)),
                          ),
                        ),
                        title: const Text('Logout'),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF595550), size: 20),
                      )
                    ],
                  ),
                )
              ]),
        ));
  }
}
