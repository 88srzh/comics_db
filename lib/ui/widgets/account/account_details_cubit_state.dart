import 'package:comics_db_app/ui/widgets/account/components/account_details_data.dart';
import 'package:equatable/equatable.dart';

class AccountDetailsCubitState extends Equatable{
  final List<AccountDetailsData> accountDetails;
  final String localeTag;

  AccountDetailsCubitState({required this.accountDetails, required this.localeTag});

  @override
  List<Object> get props => [accountDetails, localeTag];

  AccountDetailsCubitState copyWith({
    List<AccountDetailsData>? accountDetails,
    String? localeTag,
  }) {
    return AccountDetailsCubitState(
      accountDetails: accountDetails ?? this.accountDetails,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}