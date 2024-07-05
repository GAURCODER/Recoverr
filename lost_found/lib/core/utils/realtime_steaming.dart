import 'package:lost_found/core/secrets/supabase_secrets.dart';
import 'package:lost_found/features/chats/data/models/chat_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClient =
    SupabaseClient(SupaBaseSecrets.url, SupaBaseSecrets.anonKey);

Stream<List<ChatModel>> realtimeStreaming() {
  return supabaseClient
      .from('messages')
      .stream(primaryKey: ['id'])
      .order('updated_at')
      .map(
        (List<Map<String, dynamic>> eventList) =>
            eventList.map((map) => ChatModel.fromJson(map)).toList(),
      );
}
