
// To parse this JSON data, do
//
//     final aipdata = aipdataFromJson(jsonString);

import 'dart:convert';

Aipdata aipdataFromJson(String str) => Aipdata.fromJson(json.decode(str));

String aipdataToJson(Aipdata data) => json.encode(data.toJson());

class Aipdata { 
    Aipdata({
         this.activity="",
         this.type="",
         this.participants=0.0,
         this.price=0.0,
         this.link="",
         this.key="",
         this.accessibility=0.0,
    });

    String activity;
    String type;
    double participants;
    double price;
    String link;
    String key;
    double accessibility;

    factory Aipdata.fromJson(Map<String, dynamic> json) => Aipdata(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"],
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"],
    );

    Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
    };
}
