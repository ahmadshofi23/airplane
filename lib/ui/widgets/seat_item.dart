import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SeatItem extends StatelessWidget {
  // final int status;
  final String id;
  final bool isAvailabel;
  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.read<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailabel) {
        return kUnavailabeColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kUnavailabeColor;
        }
      }
      // switch (isSelected) {
      //   case 0:
      //     return kAvailableColor;
      //   case 1:
      //     return kPrimaryColor;
      //   case 2:
      //     return kUnavailabeColor;
      //   default:
      //     return kUnavailabeColor;
      // }
    }

    borderColor() {
      if (!isAvailabel) {
        return kUnavailabeColor;
      } else {
        return kPrimaryColor;
      }
      // switch (status) {
      //   case 0:
      //     return kPrimaryColor;
      //   case 1:
      //     return kPrimaryColor;
      //   case 2:
      //     return kUnavailabeColor;
      //   default:
      //     return kUnavailabeColor;
      // }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'You',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
      // switch (status) {
      //   case 0:
      //     return Center(child: Text(''));
      //   case 1:
      //     return Center(
      //       child: Text(
      //         'YOU',
      //         style: whiteTextStyle.copyWith(
      //           fontWeight: semiBold,
      //         ),
      //       ),
      //     );
      //   case 2:
      //     return Center(child: Text(''));
      //   default:
      //     return Center(child: Text(''));
      // }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailabel) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: backgroundColor(),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: borderColor(),
            )),
        child: child(),
      ),
    );
  }
}
