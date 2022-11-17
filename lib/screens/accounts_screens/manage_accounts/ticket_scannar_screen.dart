import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class TicketScannerScreen extends StatefulWidget {
  const TicketScannerScreen({Key? key}) : super(key: key);

  @override
  State<TicketScannerScreen> createState() => _TicketScannerScreenState();
}

class _TicketScannerScreenState extends State<TicketScannerScreen> {
  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Scan_Code_Title", style: Theme.of(context).textTheme.titleMedium,).tr(),
        centerTitle: true,
        iconTheme: const IconThemeData(
           color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width / 1.2,
              width: double.infinity,
              child: QRView(key: _gLobalkey, onQRViewCreated: qr,
                overlay: QrScannerOverlayShape(
                  borderColor: Theme.of(context).primaryColor,
                borderRadius: 0,
                borderLength: 30,
                  borderWidth: 10,
                  cutOutWidth: MediaQuery.of(context).size.width / 1.1,
                  cutOutHeight: MediaQuery.of(context).size.width / 1.5,
                  // overlayColor: Colors.white
                ),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 5,
            ),
             Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 1.4,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (result != null)
                      ? Column(
                        children: [
                          Text('${result!.code}',
                            style: Theme.of(context).textTheme.titleMedium,),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 5,
                          ),
                          CustomButton(onPress: (){}, buttonName: "Send Code")
                        ],
                      )
                      : Column(
                    children: <Widget>[
                      const Icon(Icons.qr_code_scanner_sharp, size: 30, color: Colors.black,),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 50,
                      ),
                      Text(
                        "Scan_a_Code",
                        style: Theme.of(context).textTheme.titleLarge,
                      ).tr(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "Scan_Code_Text",
                        style: Theme.of(context).textTheme.labelLarge,
                      ).tr(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                       InkWell(
                         onTap: (){
                           Navigator.of(context).pushNamed(MyRoutes.ADDTICKETMANUALLYROUTE);
                         },
                         child: const Text(
                          "Scan_Code_Add_Tickets",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontFamily: 'Cerebri Sans Bold',
                          ),
                      ).tr(),
                       ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 10,
                      ),
                      const Text("Scan_Code_Add_CESU", style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontFamily: 'Cerebri Sans Bold',
                      ),
                      ).tr(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
