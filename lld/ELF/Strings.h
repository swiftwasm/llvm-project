//===- Strings.h ------------------------------------------------*- C++ -*-===//
//
//                             The LLVM Linker
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLD_ELF_STRINGS_H
#define LLD_ELF_STRINGS_H

#include "lld/Core/LLVM.h"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/Optional.h"
#include "llvm/ADT/StringRef.h"
#include <vector>

namespace lld {
namespace elf {

int getPriority(StringRef S);
bool hasWildcard(StringRef S);
std::vector<uint8_t> parseHex(StringRef S);
bool isValidCIdentifier(StringRef S);
StringRef unquote(StringRef S);

// This class represents a glob pattern. Supported metacharacters
// are "*", "?", "[<chars>]" and "[^<chars>]".
class GlobPattern {
public:
  explicit GlobPattern(StringRef Pat);
  bool match(StringRef S) const;

private:
  bool matchOne(ArrayRef<llvm::BitVector> Pat, StringRef S) const;
  llvm::BitVector scan(StringRef &S);
  llvm::BitVector expand(StringRef S);

  // Parsed glob pattern.
  std::vector<llvm::BitVector> Tokens;

  // A glob pattern given to this class. This is for error reporting.
  StringRef Original;

  // The following members are for optimization.
  llvm::Optional<StringRef> Exact;
  llvm::Optional<StringRef> Prefix;
  llvm::Optional<StringRef> Suffix;
};

// This class represents multiple glob patterns.
class StringMatcher {
public:
  StringMatcher() = default;
  explicit StringMatcher(const std::vector<StringRef> &Pat);

  bool match(StringRef S) const;

private:
  std::vector<GlobPattern> Patterns;
};

// Returns a demangled C++ symbol name. If Name is not a mangled
// name or the system does not provide __cxa_demangle function,
// it returns an unmodified string.
std::string demangle(StringRef Name);

inline StringRef toStringRef(ArrayRef<uint8_t> Arr) {
  return {(const char *)Arr.data(), Arr.size()};
}
}
}

#endif
