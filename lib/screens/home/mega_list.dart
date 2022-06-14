import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysocial/models/mega.dart';
import 'package:provider/provider.dart';

class MegaList extends StatefulWidget {
  const MegaList({Key? key}) : super(key: key);

  @override
  State<MegaList> createState() => _MegaListState();
}

class _MegaListState extends State<MegaList> {
  @override
  Widget build(BuildContext context) {
    final mega = Provider.of<List<Mega>>(context);
    mega.forEach(
      (meg) {
        print(meg.username);
        print(meg.fullname);
      },
    );
    return Container();
  }
}
