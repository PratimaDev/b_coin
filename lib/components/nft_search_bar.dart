import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NFTSearchBar extends StatefulWidget {
  @override
  _NFTSearchBarState createState() => _NFTSearchBarState();
}

class _NFTSearchBarState extends State<NFTSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  String _dropdownValue = 'Price';

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      // Filter logic goes here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Search Bar
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) => _filterItems(),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Enter name to search...',
              hintStyle: TextStyle(fontSize: 14.sp),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,),
              borderRadius: BorderRadius.circular(15.r)
            ),focusColor: Colors.black,hoverColor: Colors.black

            ),

          ),
        ),
        SizedBox(width: 8.w),
        // Dropdown Button
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade600, width: 1.w,),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: DropdownButton<String>(
            value: _dropdownValue,
            icon: Icon(Icons.keyboard_arrow_down),
            items: ['Price', 'Recently Added'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(value,style: TextStyle(fontSize: 14.sp),),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _dropdownValue = newValue!;
              });
            },
          ),
        ),
        SizedBox(width: 10.w),
        // Slider Icon
        GestureDetector(
          onTap: () {
            setState(() {
              _dropdownValue = _dropdownValue == 'Price' ? 'Recently Added' : 'Price';
            });
          },
          child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB8860B), Color(0xFFFFF5B6), Color(0xFFDAA520)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.tune, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
