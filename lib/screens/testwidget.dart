import 'package:flutter/material.dart';


class IdCard extends StatefulWidget {
  const IdCard({Key? key}) : super(key: key);

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFF5F5F5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/811/600',
                    ),
                  ),
                  Text(
                    'Hello World',
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
