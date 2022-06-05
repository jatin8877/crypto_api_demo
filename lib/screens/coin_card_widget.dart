import 'package:flutter/material.dart';

class CoinCard extends StatefulWidget {
  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercentage;
  CoinCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  }) : super(key: key);

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(4, 4), // changes position of shadow
                ),
              ],
            ),
            child: Card(
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // if you need this
                  ),
                  tileColor: const Color.fromARGB(213, 255, 255, 255),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: 2),
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Image.network(widget.imageUrl),
                  ),
                  title: Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(widget.symbol),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${widget.price}',
                        style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.change.toDouble() < 0
                            ? widget.change.toDouble().toString()
                            : '+ ${widget.change.toDouble().toString()}',
                        style: TextStyle(
                            color: widget.change.toDouble() < 0
                                ? Colors.red
                                : Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.changePercentage.toDouble() < 0
                            ? widget.changePercentage.toDouble().toString() +
                                '%'
                            : '+ ${widget.changePercentage.toDouble().toString()} %',
                        style: TextStyle(
                            color: widget.changePercentage.toDouble() < 0
                                ? Colors.red
                                : Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}




// child: Card(
//               elevation: 20.0,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 child: ListTile(
//                   leading: Hero(
//                     tag: hotel[index].id,
//                     child: Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.network(
//                         hotel[index].imageUrl,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   title: Text(hotel[index].location),
//                   subtitle: Text(hotel[index].via),
//                   trailing: const Icon(Icons.chevron_right),