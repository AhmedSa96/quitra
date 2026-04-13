import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDataSource {
  Future<Map<String, dynamic>?> getHomeStats();
  Future<void> logCraving();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupabaseClient supabase;

  HomeRemoteDataSourceImpl(this.supabase);

  @override
  Future<Map<String, dynamic>?> getHomeStats() async {
    final user = supabase.auth.currentUser;
    if (user == null) return null;

    final response = await supabase
        .from('profiles')
        .select('quit_start_date, cigarettes_per_day')
        .eq('id', user.id)
        .maybeSingle();

    return response;
  }

  @override
  Future<void> logCraving() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase.from('craving_events').insert({'user_id': user.id});
  }
}
