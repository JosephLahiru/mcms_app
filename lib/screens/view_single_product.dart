import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/screens/appdrawer.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ViewSingleProduct extends StatefulWidget {
  final dynamic product;
  final String highlightCondition;

  const ViewSingleProduct({Key? key, required this.product, required this.highlightCondition}) : super(key: key);

  @override
  State<ViewSingleProduct> createState() => _ViewSingleProductState(highlightCondition: highlightCondition);
}

class _ViewSingleProductState extends State<ViewSingleProduct> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String highlightCondition;

  _ViewSingleProductState({required this.highlightCondition});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColorHeading =
    colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final containerColor1 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackfifth
        : color.AppColors.gradientpurplefirst;
    final containerColor2 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackeighth
        : color.AppColors.gradientpurplesecond;
    final DateTime? parsedDateM = widget.product['mfd_date'] != null ? DateTime.tryParse(widget.product['mfd_date']) : null;
    final DateTime? parsedDateE = widget.product['exp_date'] != null ? DateTime.tryParse(widget.product['exp_date']) : null;
    final DateTime? parsedDateP = widget.product['purchased_date'] != null ? DateTime.tryParse(widget.product['purchased_date']) : null;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
        child: Column(
          children: [
            // header
            Row(
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.bars),
                  color: textColorHeading,
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                SizedBox(width: 10.0),
                Text(
                  "Selected Product",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: textColorHeading,
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: color.AppColors.grey,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // body content
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        gradient: flutter_gradient.LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            containerColor1.withOpacity(0.8),
                            containerColor2.withOpacity(0.9),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset(5, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildRow('Brand Name', '${widget.product['brand_name'] ?? 'N/A'}', 'brand_name'),
                                  _buildRow('Product Name', '${widget.product['prdct_name'] ?? 'N/A'}', 'prdct_name'),
                                  _buildRow('Product Description', '${widget.product['description'] ?? 'N/A'}', 'description'),
                                  _buildRow('Manufactured Date', '${parsedDateM != null ? DateFormat('dd-MM-yyyy').format(parsedDateM) : 'Invalid date'}', 'mfd_date'),
                                  _buildRow('Expiry Date', '${parsedDateE != null ? DateFormat('dd-MM-yyyy').format(parsedDateE) : 'Invalid date'}', 'exp_date'),
                                  _buildRow('Purchased Date', '${parsedDateP != null ? DateFormat('dd-MM-yyyy').format(parsedDateP) : 'Invalid date'}', 'purchased_date'),
                                  _buildRow('Acquisition Price', 'Rs. ${widget.product['ac_price'] ?? 'N/A'}', 'ac_price'),
                                  _buildRow('Selling Price', 'Rs. ${widget.product['sell_price'] ?? 'N/A'}', 'sell_price'),
                                  _buildRow('Total Quantity', '${widget.product['total_quantity'] ?? 'N/A'}', 'total_quantity'),
                                  _buildRow('Medicine Type', '${widget.product['med_type'] ?? 'N/A'}', 'med_type'),
                                  _buildRow(
                                      'Stock Type',
                                      '${widget.product['stock_type'] == '1' ? "Essential meds" : widget.product['stock_type'] == '2' ? "Standard inventory" : "Bulk supplies"}', 'stock_type'),
                                  _buildRow(
                                      'Expire Type',
                                      '${widget.product['expire_type'] == '1' ? "Short lifespan" : widget.product['expire_type'] == '2' ? "Medium lifespan" : "Long lifespan"}', 'expire_type'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }

  Widget _buildRow(String label, String data, String rowId) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 20.0,
              color: (highlightCondition == 'expire' &&
                  (rowId == 'exp_date' || rowId == 'mfd_date')) ||
                  (highlightCondition == 'low_stock' && rowId == 'total_quantity')
                  ? color.AppColors.amber
                  : color.AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.0), // Adjust this size as per your need.
          Text(
            data,
            style: TextStyle(
              fontSize: 18.0,
              color: (highlightCondition == 'expire' &&
                  (rowId == 'exp_date' || rowId == 'mfd_date')) ||
                  (highlightCondition == 'low_stock' && rowId == 'total_quantity')
                  ? color.AppColors.amber
                  : color.AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
