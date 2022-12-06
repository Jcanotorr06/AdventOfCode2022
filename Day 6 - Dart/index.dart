import 'dart:io';

void main() {
  var file = new File('input.txt').readAsStringSync();
  var chars = file.split("");
  var packetMarker = "";
  var packetMarkerIndex = 0;
  var messageMarker = "";
  var messageMarkerIndex = 0;

  var part1 = FindMarker(chars, file, 4);
  var part2 = FindMarker(chars, file, 14);

  packetMarker = part1[0];
  packetMarkerIndex = part1[1];
  messageMarker = part2[0];
  messageMarkerIndex = part2[1];

  /* for (var i = 0; i < chars.length; i++) {
    var substr = file.substring(i, i + 4);
    var set = new Set.from(substr.split(""));
    if (set.length == substr.length) {
      packetMarker = substr;
      packetMarkerIndex = i + 4;
      break;
    }
  }

  for (var i = 0; i < chars.length; i++) {
    var substr = file.substring(i, i + 14);
    var set = new Set.from(substr.split(""));
    if (set.length == substr.length) {
      messageMarker = substr;
      messageMarkerIndex = i + 14;
      break;
    }
  } */

  print("Packet Marker: $packetMarker");
  print("Packet Marker Index: $packetMarkerIndex");
  print("Message Marker: $messageMarker");
  print("Message Marker Index: $messageMarkerIndex");
}

FindMarker(List<String> list, String string, int markerLenght) {
  var marker = "";
  var markerIndex = 0;
  for (var i = 0; i < list.length; i++) {
    var substr = string.substring(i, i + markerLenght);
    var set = new Set.from(substr.split(""));
    if (set.length == substr.length) {
      marker = substr;
      markerIndex = i + markerLenght;
      break;
    }
  }
  return [marker, markerIndex];
}
