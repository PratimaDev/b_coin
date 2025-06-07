import 'package:b_coin/services/nft_service.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'nft_service.dart'; // Adjust the import path as necessary

class NFTScreenRealTime extends StatefulWidget {
  @override
  _NFTScreenRealTimeState createState() => _NFTScreenRealTimeState();
}

class _NFTScreenRealTimeState extends State<NFTScreenRealTime> {
  List<Map<String, dynamic>> _nfts = [];
  bool _isLoading = true;
  String selectedCategory = 'All';

  final List<String> _categories = ['All', 'Cartoon', 'Art', 'Gaming', 'Collectible', 'Other'];

  // Sample: Lens Protocol on Polygon (works)
  final String _contractAddress = '0x1A92f7381B9F03921564a437210bB9396471050C';


  @override
  void initState() {
    super.initState();
    _loadNFTs();
  }

  Future<void> _loadNFTs() async {
    setState(() => _isLoading = true);
    try {
      final nfts = await NFTService.fetchNFTsFromContract(
        contractAddress: _contractAddress,
      );
      print('📦 NFTs Fetched: ${nfts.length}');
      setState(() {
        _nfts = nfts;
        _isLoading = false;
      });
    } catch (e) {
      print('❌ Error loading NFTs: $e');
      setState(() => _isLoading = false);
    }
  }

  List<Map<String, dynamic>> get _filteredNFTs {
    if (selectedCategory == 'All') return _nfts;
    return _nfts.where((nft) => nft['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real NFTs from Alchemy'),
        actions: [
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
            items: _categories.map((cat) => DropdownMenuItem(
              value: cat,
              child: Text(cat),
            )).toList(),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _loadNFTs,
        child: _filteredNFTs.isEmpty
            ? ListView(
          children: [
            SizedBox(height: 100),
            Center(child: Text('No NFTs found!')),
          ],
        )
            : ListView.builder(
          itemCount: _filteredNFTs.length,
          itemBuilder: (context, index) {
            final nft = _filteredNFTs[index];
            final imageUrl = nft['image'] ?? '';

            return ListTile(
              leading: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Icon(Icons.broken_image),
              ),
              title: Text(nft['name']),
              subtitle: Text(nft['category']),
            );
          },
        ),
      ),
    );
  }
}
