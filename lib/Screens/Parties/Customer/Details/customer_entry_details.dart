import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery/Comman/button.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';

class CustomerEntryDetails extends StatefulWidget {
  const CustomerEntryDetails({super.key});

  @override
  State<CustomerEntryDetails> createState() => _CustomerEntryDetailsState();
}

class _CustomerEntryDetailsState extends State<CustomerEntryDetails> {
  @override
  Widget build(BuildContext context) {
    const style1 = TextStyle(
      fontSize: 20,
      color: kBlackColor,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
    final style2 = TextStyle(
      fontSize: 18,
      color: kBlackColor.withOpacity(0.8),
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
    const amountStyle = TextStyle(
      fontSize: 18,
      color: kDarkGreenColor,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Entry Details"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                showDeleteAlert(context);
              },
              child: const Icon(
                CupertinoIcons.delete,
                color: kButtonColor,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: kPadding15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kSize10,
              Center(
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: const BoxDecoration(
                    color: kButtonColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "H",
                      // data.name.substring(0, 1)
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: 25,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              kSize10,
              const Center(
                child: Text(
                  "Hasan Abbas",
                  style: TextStyle(
                    fontSize: 20,
                    color: kBlackColor,
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              kSize45,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Type",
                    style: style1,
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Text(
                      "Credit",
                      style: style2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              kSize3,
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Date",
                    style: style1,
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Text(
                      "Jan 06, 2025",
                      style: style2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              kSize3,
              const Divider(),
              kSize3,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amount",
                    style: style1,
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: Text(
                      "₹ 10,000.00",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: amountStyle,
                    ),
                  ),
                ],
              ),
              kSize3,
              const Divider(),
              kSize3,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Weight/Fine",
                    style: style1,
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Text(
                      "100 kg (Silver)",
                      style: style2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              kSize3,
              const Divider(),
              kSize3,
              const Text(
                "Description",
                style: style1,
              ),
              kSize3,
              Text(
                "This entry has additional details",
                style: style2,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              kSize35,
              CommanButton(
                buttonText: "Edit Entry",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  // Alert Dialog

  void showDeleteAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              "Delete",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: kFontFamily,
              ),
            ),
          ),
          content: const Text(
            "Are you sure you want to delete this entry?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: kFontFamily,
              fontSize: 17,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 22,
                  fontFamily: kFontFamily,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text("Item deleted successfully!"),
                  ),
                );
              },
              child: const Text(
                "Delete",
                style: TextStyle(
                  color: kRedColor,
                  fontSize: 22,
                  fontFamily: kFontFamily,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
