// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class NFTService {
//   static const String apiKey =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub25jZSI6ImNjYjAyOTg5LWFhMTUtNDk5MC04ZDQ1LTQ4MmM2NDU4ZTlhNiIsIm9yZ0lkIjoiNDQ2NjAxIiwidXNlcklkIjoiNDU5NDk1IiwidHlwZUlkIjoiZjBkMWIzZDItOWU2Yy00ZGQxLWEwNjQtYjA4NjVlMzE2YmM1IiwidHlwZSI6IlBST0pFQ1QiLCJpYXQiOjE3NDcwNDA2NDgsImV4cCI6NDkwMjgwMDY0OH0.vCNrRbIghnKt4WEDqBMo_UpD96l5GZ7oxzRIeAkCO0U'; // replace with your real key
//
//   static Future<List<Map<String, dynamic>>> fetchNFTs(
//       String walletAddress, {
//         String chain = 'eth',
//       }) async {
//     final List<Map<String, dynamic>> allNFTs = [];
//     String? cursor;
//
//     do {
//       final url = Uri.parse(
//         'https://deep-index.moralis.io/api/v2.2/$walletAddress/nft'
//             '?chain=$chain'
//             '&format=decimal'
//             '&limit=10'
//             '&normalizeMetadata=true'
//             '${cursor != null ? '&cursor=$cursor' : ''}',
//       );
//
//       final response = await http.get(
//         url,
//         headers: {
//           'accept': 'application/json',
//           'X-API-Key': apiKey,
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> nfts = data['result'];
//         cursor = data['cursor'];
//
//         final parsedNFTs = nfts.map<Map<String, dynamic>>((nft) {
//           final metadata = nft['normalized_metadata'] ?? nft['metadata'] ?? {};
//           final name = metadata['name'] ?? nft['name'] ?? '';
//           final rawImage = metadata['image'] ?? '';
//
//           return {
//             'name': name.toString(),
//             'image': fixImageUrl(rawImage.toString()),
//           };
//         }).where((nft) => isValidNFT(nft)).toList();
//
//         allNFTs.addAll(parsedNFTs);
//       } else {
//         throw Exception('❌ Failed to fetch NFTs: ${response.statusCode}');
//       }
//     } while (cursor != null);
//
//     return allNFTs;
//   }
//
//   static String fixImageUrl(String url) {
//     if (url.startsWith('ipfs://')) {
//       return url.replaceFirst('ipfs://', 'https://ipfs.io/ipfs/');
//     } else if (url.startsWith('ipfs/')) {
//       return 'https://ipfs.io/' + url;
//     }
//     return url;
//   }
//
//   static bool isValidNFT(Map<String, dynamic> nft) {
//     final name = nft['name']?.toLowerCase() ?? '';
//     final image = nft['image'] ?? '';
//
//     if (name.contains('usdt') ||
//         name.contains('reward') ||
//         name.contains('voucher') ||
//         name.contains('airdrop') ||
//         name.contains('claim') ||
//         name.contains('test')) {
//       return false;
//     }
//
//     if (image.isEmpty ||
//         image.contains('undefined') ||
//         image.contains('data:')) {
//       return false;
//     }
//
//     return true;
//   }
// }
// lib/services/nft_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class NFTService {
  static const String _alchemyApiKey = 'Mn1g6iIP-TnZJ73DaafipsxgjAiRasZv';
  // static const String _alchemyBaseUrl =
  //     'https://polygon-mainnet.g.alchemy.com/v2/$_alchemyApiKey';

  static Future<List<Map<String, dynamic>>> fetchNFTsFromContract({
    required String contractAddress,
  }) async {
    final url = Uri.parse(

        'https://eth-mainnet.g.alchemy.com/nft/v3/Mn1g6iIP-TnZJ73DaafipsxgjAiRasZv/getNFTsForCollection?contractAddress=$contractAddress&withMetadata=true',
    );

    final response = await http.get(url);
    int counter = 1;
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> nfts = jsonData['nfts'] ?? [];

      return nfts.map<Map<String, dynamic>>((item) {
        final metadata = item['metadata'] ?? {};
        String name = metadata['name'] ?? '';
        if (name.trim().isEmpty) {
          name = 'NFT #$counter';
        }
        counter++;
        final description = metadata['description'] ?? '';
        final rawImage = metadata['image'] ?? '';
        final imageUrl = _formatImageUrl(rawImage);
        final category = _getCategory(name, description);

        return {
          'name': name,
          'image': imageUrl,
          'description': description,
          'category': category,

        };

      }).toList();
    } else {
      print('❌ API Error: ${response.statusCode}');
      throw Exception('API error: ${response.statusCode}');
    }
  }

  static String _getCategory(String name, String description) {
    final text = '${name.toLowerCase()} ${description.toLowerCase()}';

    if (text.contains('cartoon') || text.contains('funny')) return 'Cartoon';
    if (text.contains('art') || text.contains('drawing')) return 'Art';
    if (text.contains('game') || text.contains('character')) return 'Gaming';
    if (text.contains('punk')) return 'Collectible';

    return 'Other';
  }

  static String _formatImageUrl(String url) {
    if (url.startsWith('ipfs://')) {
      return url.replaceFirst('ipfs://', 'https://ipfs.io/ipfs/');
    }
    return url;
  }
}
