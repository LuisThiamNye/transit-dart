part of transit;

/**
 * Wrapper for [Packer] to behave like [Converter]
 */
class MsgPackEncoder extends Converter<dynamic, List<int>> {
  List<int> convert(obj) => serialize(obj);
}

/**
 * wrapper for [Unpacker] to behave like [Converter]
 */
class MsgPackDecoder extends Converter<List<int>, dynamic> {
  convert(List<int> list) => deserialize(Uint8List.fromList(list));
}
