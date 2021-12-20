import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'ammountOfTraveller': transaction.amountOfTraveler,
        'selectedSeats': transaction.selctedSeats,
        'insurace': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      print('ini result ${result}');

      List<TransactionModel> transactions = result.docs.map(
        (e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      print('Ini transaksi : ${transactions}');
      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
