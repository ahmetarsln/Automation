import 'package:demo/src/data/models/employe.dart';

class Polyclinic {
  List<Employe>? employeList;
  String? id;

  Polyclinic({required this.employeList});

  Polyclinic.fromJson(Map<String, dynamic> json) {
    employeList = json['employeList'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeList'] = this.employeList;
    return data;
  }
}

// final polyclinic = () async {
//   //var input = await File('assets/json/appointment.json').readAsString();
//   var map = jsonDecode(input);
//   var temp = map['polyclinic'];
//   var result = <Polyclinic>[];
//   for (var element in temp) {
//     result.add(Polyclinic.fromJson(element));
//   }
//   return result;
// };
