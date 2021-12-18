import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final DestinationModel destinations;
  final int amountOfTraveller;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.destinations,
    this.amountOfTraveller = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        destinations,
        amountOfTraveller,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
      ];
}
