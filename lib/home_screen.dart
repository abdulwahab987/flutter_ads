import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? bannerAd;
  bool isAdLoaded=false;
  var adUnit='ca-app-pub-3940256099942544/2435281174'; //testing ad unit



  Future<void> initBannerAd()async{
    bannerAd=BannerAd(
        size: AdSize.banner,
        adUnitId: adUnit.toString(),
        listener: BannerAdListener(
            onAdLoaded: (ad){
              setState(() {
                isAdLoaded=true;
              });
            },
            onAdFailedToLoad: (ad,error){
              ad.dispose();
              print(error);
            }
        ),
        request: AdRequest(

        )
    );
    bannerAd!.load();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     initBannerAd();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Banner Ads'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: isAdLoaded?
        SizedBox(
          height: bannerAd!.size.height.toDouble(),
          width: bannerAd!.size.width.toDouble(),
          child: AdWidget(ad: bannerAd!,),

        )
            :
        SizedBox(),
      ),

    );
  }
}
