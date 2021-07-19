import "dart:collection";
import "package:transit/transit.dart";

final DATA = [
  /* [Dart, MsgPack, JSON, JSON_VERBOSE] */
  [
    [null],
    [null],
    [null],
    [null]
  ],
  [
    [0],
    [0],
    [0],
    [0]
  ],
  [
    [-47],
    [-47],
    [-47],
    [-47]
  ],
  [
    [1 << 60],
    [1 << 60],
    ["~i${1 << 60}"],
    ["~i${1 << 60}"]
  ],
  [
    [BigInt.from(1) << 90],
    ["~n${BigInt.from(1) << 90}"],
    ["~n${BigInt.from(1) << 90}"],
    ["~n${BigInt.from(1) << 90}"]
  ],
  [
    [""],
    [""],
    [""],
    [""]
  ],
  [
    ["~test"],
    ["~~test"],
    ["~~test"],
    ["~~test"]
  ],
  [
    ["^0"],
    ["~^0"],
    ["~^0"],
    ["~^0"]
  ],
  [
    ["šôš漢字"],
    ["šôš漢字"],
    ["šôš漢字"],
    ["šôš漢字"]
  ],
  [
    [4.2],
    ["~f4.2"],
    ["~f4.2"],
    ["~f4.2"]
  ],
  [
    [true],
    [true],
    [true],
    [true]
  ],
  [
    [new TransitKeyword("K")],
    ["~:K"],
    ["~:K"],
    ["~:K"]
  ],
  [
    [new TransitSymbol("S")],
    ["~\$S"],
    ["~\$S"],
    ["~\$S"]
  ],
  [
    [new TransitBytes("Win".codeUnits)],
    ["~bV2lu"],
    ["~bV2lu"],
    ["~bV2lu"]
  ],
  [
    "pure",
    ["~#'", "pure"],
    ["~#'", "pure"],
    {"~#'": "pure"}
  ],
  [[], [], [], []],
  [
    [1, 2, 3],
    [1, 2, 3],
    [1, 2, 3],
    [1, 2, 3]
  ],
  [
    [
      1,
      [2],
      [[], 3]
    ],
    [
      1,
      [2],
      [[], 3]
    ],
    [
      1,
      [2],
      [[], 3]
    ],
    [
      1,
      [2],
      [[], 3]
    ]
  ],
  [
    {},
    ['~#cmap', []],
    ['~#cmap', []],
    {'~#cmap': []}
  ],
  [
    {[]: 0},
    [
      '~#cmap',
      [[], 0]
    ],
    [
      '~#cmap',
      [[], 0]
    ],
    {
      '~#cmap': [[], 0]
    }
  ],
  [
    new Set.from([1, 2]),
    [
      '~#set',
      [1, 2]
    ],
    [
      '~#set',
      [1, 2]
    ],
    {
      '~#set': [1, 2]
    }
  ],
  [
    new Queue(),
    ['~#list', []],
    ['~#list', []],
    {'~#list': []}
  ],
  [
    new TransitTaggedValue("tg", 2),
    ['~#tg', 2],
    ['~#tg', 2],
    {'~#tg': 2}
  ],
  [
    new TransitTaggedValue("map", {true: 0}),
    {true: 0},
    ["^ ", "~?t", 0],
    {"~?t": 0}
  ],
  [
    new TransitTaggedValue("map", {null: 0}),
    {null: 0},
    ["^ ", "~_", 0],
    {"~_": 0}
  ],
  [
    new TransitTaggedValue("map", {1: 0}),
    {1: 0},
    ["^ ", "~i1", 0],
    {"~i1": 0}
  ],
  [
    [new TransitUuid.parse("01234567-89ab-cdef-0123-456789abcdef")],
    [
      [
        "~#u",
        [81985529216486895, 81985529216486895]
      ]
    ],
    ["~u01234567-89ab-cdef-0123-456789abcdef"],
    ["~u01234567-89ab-cdef-0123-456789abcdef"],
  ],
  [
    new TransitLink(Uri.parse("http:www.a.com"), "b", "c"),
    [
      "~#link",
      {"href": "~rhttp:www.a.com", "rel": "b", "name": "c"}
    ],
    [
      "~#link",
      ["^ ", "href", "~rhttp:www.a.com", "rel", "b", "name", "c"]
    ],
    {
      "~#link": {"href": "~rhttp:www.a.com", "rel": "b", "name": "c"}
    },
  ],
  [
    [new DateTime(2047)],
    [
      ["~#m", new DateTime(2047).millisecondsSinceEpoch]
    ],
    ["~m${new DateTime(2047).millisecondsSinceEpoch}"],
    ["~t${new DateTime(2047).toIso8601String()}"],
  ],
  [
    {new DateTime(2047): 0},
    [
      "~#cmap",
      [
        ["~#m", new DateTime(2047).millisecondsSinceEpoch],
        0
      ]
    ],
    [
      "~#cmap",
      ["~m${new DateTime(2047).millisecondsSinceEpoch}", 0]
    ],
    {
      "~#cmap": ["~t${new DateTime(2047).toIso8601String()}", 0]
    },
  ],
  [
    new TransitTaggedValue("map", {new DateTime(2047): 0}),
    {
      ["~#m", new DateTime(2047).millisecondsSinceEpoch]: 0
    },
    ["^ ", "~m${new DateTime(2047).millisecondsSinceEpoch}", 0],
    {"~t${new DateTime(2047).toIso8601String()}": 0},
  ],
  [
    new TransitTaggedValue("map",
        {new TransitUuid.parse("01234567-89ab-cdef-0123-456789abcdef"): 0}),
    {
      [
        "~#u",
        [81985529216486895, 81985529216486895]
      ]: 0
    },
    ["^ ", "~u01234567-89ab-cdef-0123-456789abcdef", 0],
    {"~u01234567-89ab-cdef-0123-456789abcdef": 0},
  ],
  [
    [
      null,
      true,
      {
        2: [3, new TransitTaggedValue("4", 5)]
      }
    ],
    [
      null,
      true,
      [
        "~#cmap",
        [
          2,
          [
            3,
            ["~#4", 5]
          ]
        ]
      ]
    ],
    [
      null,
      true,
      [
        "~#cmap",
        [
          2,
          [
            3,
            ["~#4", 5]
          ]
        ]
      ]
    ],
    [
      null,
      true,
      {
        "~#cmap": [
          2,
          [
            3,
            {"~#4": 5}
          ]
        ]
      }
    ],
  ],
];
