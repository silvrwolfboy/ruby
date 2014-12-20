#include "ruby.h"

static VALUE
hash_delete(VALUE hash, VALUE key)
{
    return rb_hash_delete(hash, key);
}

void
Init_delete(VALUE klass)
{
    rb_define_method(klass, "delete!", hash_delete, 1);
}
