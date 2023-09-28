import 'package:flutter/material.dart';
import 'package:setifikasi_bnsp/app/theme/app_theme.dart';

class ItemRecentTile extends StatelessWidget {
  const ItemRecentTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
    this.height,
    this.income = true,
    this.dense = false,
  });

  final String title, subtitle, trailing;
  final Function() onTap;
  final bool income, dense;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final mediaQuery = MediaQuery.of(context);
    // height = mediaQuery.size;
    return Container(
      // color: Colors.amber,
      height: height,
      width: double.infinity,
      alignment: Alignment.center,
      child: ListTile(
        // titleAlignment: ListTileTitleAlignment.top,
        // contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: kDefaultPadding),
        onTap: onTap,
        // dense: height != null ? true : false,
        dense: dense,
        titleTextStyle: textTheme.titleMedium!.copyWith(
            // height: 0.5,
            ),
        subtitleTextStyle: textTheme.titleSmall!.copyWith(color: Colors.black26),
        // leadingAndTrailingTextStyle: textTheme.titleMedium!.copyWith(
        //   color: income ? kColorIncome : kColorExpanse,
        // ),
        leading: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: income ? kColorIncome : kColorExpanse,
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Icon(
            income ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.black45,
          ),
          // style: textTheme.titleSmall,
          softWrap: true,
        ),
        // isThreeLine: true,
        // dense: true,
        // visualDensity: VisualDensity.standard,
        trailing: Text(
          income ? "+ $trailing" : "- $trailing",
          style: TextStyle(
            color: income ? kColorIncome : kColorExpanse,
            fontSize: dense ? 10 : 14,
          ),
          // style: textTheme.titleMedium!.copyWith(
          //   color: income ? kColorIncome : kColorExpanse,
          // ),
        ),
      ),
    );
  }
}
