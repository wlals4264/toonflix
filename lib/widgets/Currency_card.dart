import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currencyName, currencyCode, amount;
  final IconData iconData;
  final bool isInverted;
  final int order;

  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.currencyName,
    required this.currencyCode,
    required this.amount,
    required this.iconData,
    required this.isInverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, order * -20),
      child: Container(
        clipBehavior: Clip
            .hardEdge, // to make sure content doesn't overflow, like the icon(cut it)
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currencyName,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        currencyCode,
                        style: TextStyle(
                          color: Colors.white.withAlpha(200),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.translate(
                // move the icon position
                offset: const Offset(-10, 25),
                child: Transform.scale(
                  scale: 2.2,
                  child: Icon(
                    iconData,
                    color: isInverted ? _blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
