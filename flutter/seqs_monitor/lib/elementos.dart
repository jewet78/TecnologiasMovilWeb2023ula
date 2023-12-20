import 'package:flutter/material.dart';
import 'detalles.dart';
                 

class MiniCard extends StatefulWidget {
  final String title;
  final List<ExpandableItem> items;

  const MiniCard({required this.title, required this.items});

  @override
  _MiniCardState createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  List<bool> _expandedList = [];

  @override
  void initState() {
    super.initState();
    _expandedList = List.generate(widget.items.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom:10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              itemCount: widget.items.length,
              separatorBuilder: (context, index) => SizedBox(height: 5), // Añade un espacio de 20 de altura entre los elementos
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(widget.items[index].title),
                      onTap: () {
                        setState(() {
                          _expandedList[index] = !_expandedList[index];
                        });
                      },
                    ),
                    if (_expandedList[index])
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.items[index].content),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to the details screen for the specific item
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetallesScreen(itemName: widget.items[index].title),
                                  ),
                                );
                              },
                              child: Text('Ver Detalles'),
                            ),
                          ],
                        ),
                      ),
                    const Divider(),
                  ],
                );
              },
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class ExpandableItem {
  final String title;
  final String content;

  ExpandableItem({required this.title, required this.content});
}


class Card1 extends StatelessWidget {
  final String itemName;
  final int completedSteps;
  final int totalSteps;

  const Card1({
    required this.itemName,
    required this.completedSteps,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pasos completados: $completedSteps',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'de $totalSteps',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            // Aquí puedes agregar más detalles o personalizar según tus necesidades
          ],
        ),
      ),
    );
  }
}


class CustomTable extends StatelessWidget {
  final List<List<String>> tableData;

  const CustomTable({required this.tableData});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: _buildTableRowWidgets(tableData),
    );
  }

  List<TableRow> _buildTableRowWidgets(List<List<String>> data) {
    return data.map((rowData) {
      return TableRow(
        children: rowData.map((cellData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cellData,
              textAlign: TextAlign.center,
            ),
          );
        }).toList(),
      );
    }).toList();
  }
}



class Card2 extends StatelessWidget {
  final String title;
  final List<List<String>> tableData;

  const Card2({
    required this.title,
    required this.tableData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CustomTable(tableData: tableData),
          ],
        ),
      ),
    );
  }
}



/*
class YourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ExpandableItem> expandableItems = [
      ExpandableItem(
        title: 'Item 1',
        content: 'Additional information for Item 1',
      ),
      ExpandableItem(
        title: 'Item 2',
        content: 'Additional information for Item 2',
      ),
      // Add more items here as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Accordion Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MiniCard(title: 'Accordion', items: expandableItems),
      ),
    );
  }
}

*/