// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubscriptionState _$UNSUBSCRIBED =
    const SubscriptionState._('UNSUBSCRIBED');
const SubscriptionState _$SUBSCRIBED = const SubscriptionState._('SUBSCRIBED');
const SubscriptionState _$IGNORED = const SubscriptionState._('IGNORED');

SubscriptionState _$valueOf(String name) {
  switch (name) {
    case 'UNSUBSCRIBED':
      return _$UNSUBSCRIBED;
    case 'SUBSCRIBED':
      return _$SUBSCRIBED;
    case 'IGNORED':
      return _$IGNORED;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubscriptionState> _$values =
    new BuiltSet<SubscriptionState>(const <SubscriptionState>[
  _$UNSUBSCRIBED,
  _$SUBSCRIBED,
  _$IGNORED,
]);

Serializer<SubscriptionState> _$subscriptionStateSerializer =
    new _$SubscriptionStateSerializer();

class _$SubscriptionStateSerializer
    implements PrimitiveSerializer<SubscriptionState> {
  @override
  final Iterable<Type> types = const <Type>[SubscriptionState];
  @override
  final String wireName = 'SubscriptionState';

  @override
  Object serialize(Serializers serializers, SubscriptionState object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SubscriptionState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubscriptionState.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
