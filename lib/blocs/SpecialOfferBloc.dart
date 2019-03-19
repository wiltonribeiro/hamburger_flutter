import 'package:rxdart/rxdart.dart';
import 'package:hamburger_flutter/models/Burger.dart';
import 'package:hamburger_flutter/repositories/SpecialOffersRepository.dart';

class SpecialOfferBloc {

  SpecialOffersRepository _offersRepository = new SpecialOffersRepository();
  PublishSubject<List<Burger>> _publishSubject = new PublishSubject<List<Burger>>();

  Observable<List<Burger>> get allOffers => _publishSubject.stream;

  void fetchOffers() async {
    var data = await _offersRepository.fetchSpecialOffers();
    _publishSubject.sink.add(data);
  }

  dispose(){
    _offersRepository = null;
    _publishSubject.close();
  }
}