// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_state.g.dart';

/// The possible states of a subscription.
class SubscriptionState extends EnumClass {
  const SubscriptionState._(String name) : super(name);

  /// The User is only notified when participating or @mentioned.
  static const SubscriptionState UNSUBSCRIBED = _$UNSUBSCRIBED;

  /// The User is notified of all conversations.
  static const SubscriptionState SUBSCRIBED = _$SUBSCRIBED;

  /// The User is never notified.
  static const SubscriptionState IGNORED = _$IGNORED;

  static Serializer<SubscriptionState> get serializer =>
      _$subscriptionStateSerializer;
  static BuiltSet<SubscriptionState> get values => _$values;
  static SubscriptionState valueOf(String name) => _$valueOf(name);
}
