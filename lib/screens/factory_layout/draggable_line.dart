import 'package:flutter/material.dart';

class DraggableLine extends StatefulWidget {
  final Function(double, double) onWeightChanged;

  const DraggableLine({required this.onWeightChanged});

  @override
  State<DraggableLine> createState() => _DraggableLineState();
}

class _DraggableLineState extends State<DraggableLine> {
  double _position = 0.5;

  @override
  Widget build(BuildContext context) {
    return 
    // Row(
    //   children: [
        // SizedBox(height: 10),
        // Slider(
        //   value: _position,
        //   onChanged: (newValue) {
        //     setState(() {
        //       _position = newValue;
        //       widget.onWeightChanged(_position, 1.0 - _position);
        //     });
        //   },
        // ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text('时间权重: ${(_position).toStringAsFixed(2)}',style: TextStyle(fontSize: 20),),),
            Expanded(
              flex: 2,
              child: Slider(
          value: _position,
          onChanged: (newValue) {
            setState(() {
              _position = newValue;
              widget.onWeightChanged(_position, 1.0 - _position);
            });
          },
        ),),
            Expanded(child: Text('利润权重: ${(1.0 - _position).toStringAsFixed(2)}',style: TextStyle(fontSize: 20),),),
            
            
                    
            
          ],
      //   ),
      // ],
    );
  }
}