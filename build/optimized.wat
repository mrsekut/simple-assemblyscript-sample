(module
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$d (func (result f64)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$viid (func (param i32 i32 f64)))
 (import "index" "BGR_DEAD" (global $assembly/index/BGR_DEAD i32))
 (import "index" "BGR_ALIVE" (global $assembly/index/BGR_ALIVE i32))
 (import "index" "BIT_ROT" (global $assembly/index/BIT_ROT i32))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 8) "\0c\00\00\00~\00l\00i\00b\00/\00m\00a\00t\00h\00.\00t\00s")
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $assembly/index/w (mut i32) (i32.const 0))
 (global $assembly/index/h (mut i32) (i32.const 0))
 (global $assembly/index/s (mut i32) (i32.const 0))
 (global $~lib/math/random_seeded (mut i32) (i32.const 0))
 (global $~lib/math/random_state0_64 (mut i64) (i64.const 0))
 (global $~lib/math/random_state1_64 (mut i64) (i64.const 0))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "init" (func $assembly/index/init))
 (export "step" (func $assembly/index/step))
 (export "fill" (func $assembly/index/fill))
 (func $~lib/math/NativeMath.random (; 1 ;) (type $FUNCSIG$d) (result f64)
  (local $0 i64)
  (local $1 i64)
  global.get $~lib/math/random_seeded
  i32.eqz
  if
   i32.const 0
   i32.const 8
   i32.const 987
   i32.const 24
   call $~lib/env/abort
   unreachable
  end
  global.get $~lib/math/random_state0_64
  local.set $0
  global.get $~lib/math/random_state1_64
  local.tee $1
  global.set $~lib/math/random_state0_64
  local.get $0
  local.get $0
  i64.const 23
  i64.shl
  i64.xor
  local.tee $0
  i64.const 17
  i64.shr_u
  local.get $0
  i64.xor
  local.get $1
  i64.xor
  local.get $1
  i64.const 26
  i64.shr_u
  i64.xor
  local.tee $0
  global.set $~lib/math/random_state1_64
  local.get $0
  local.get $1
  i64.add
  i64.const 4503599627370495
  i64.and
  i64.const 4607182418800017408
  i64.or
  f64.reinterpret_i64
  f64.const 1
  f64.sub
 )
 (func $assembly/index/init (; 2 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  global.set $assembly/index/w
  local.get $1
  global.set $assembly/index/h
  local.get $0
  local.get $1
  i32.mul
  global.set $assembly/index/s
  i32.const 0
  local.set $0
  loop $repeat|0
   block $break|0
    local.get $0
    global.get $assembly/index/h
    i32.ge_s
    br_if $break|0
    i32.const 0
    local.set $1
    loop $repeat|1
     block $break|1
      local.get $1
      global.get $assembly/index/w
      i32.ge_s
      br_if $break|1
      local.get $1
      local.set $2
      local.get $0
      local.set $3
      call $~lib/math/NativeMath.random
      f64.const 0.1
      f64.gt
      if (result i32)
       global.get $assembly/index/BGR_DEAD
       i32.const 16777215
       i32.and
      else       
       global.get $assembly/index/BGR_ALIVE
       i32.const -16777216
       i32.or
      end
      local.set $4
      global.get $assembly/index/s
      local.get $3
      global.get $assembly/index/w
      i32.mul
      i32.add
      local.get $2
      i32.add
      i32.const 2
      i32.shl
      local.get $4
      i32.store
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $repeat|1
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $repeat|0
   end
  end
 )
 (func $assembly/index/step (; 3 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $assembly/index/h
  i32.const 1
  i32.sub
  local.set $6
  global.get $assembly/index/w
  i32.const 1
  i32.sub
  local.set $7
  loop $repeat|0
   block $break|0
    local.get $0
    global.get $assembly/index/h
    i32.ge_s
    br_if $break|0
    local.get $0
    i32.const 1
    i32.sub
    local.get $6
    local.get $0
    select
    local.set $4
    i32.const 0
    local.get $0
    i32.const 1
    i32.add
    local.get $0
    local.get $6
    i32.eq
    select
    local.set $5
    i32.const 0
    local.set $1
    loop $repeat|1
     block $break|1
      local.get $1
      global.get $assembly/index/w
      i32.ge_s
      br_if $break|1
      local.get $1
      i32.const 1
      i32.sub
      local.get $7
      local.get $1
      select
      local.tee $2
      local.get $4
      global.get $assembly/index/w
      i32.mul
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      local.get $4
      global.get $assembly/index/w
      i32.mul
      local.get $1
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      i32.const 0
      local.get $1
      i32.const 1
      i32.add
      local.get $1
      local.get $7
      i32.eq
      select
      local.tee $3
      local.get $4
      global.get $assembly/index/w
      i32.mul
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $0
      global.get $assembly/index/w
      i32.mul
      local.get $2
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $0
      global.get $assembly/index/w
      i32.mul
      local.get $3
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $5
      global.get $assembly/index/w
      i32.mul
      local.get $2
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $5
      global.get $assembly/index/w
      i32.mul
      local.get $1
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $5
      global.get $assembly/index/w
      i32.mul
      local.get $3
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.set $3
      local.get $0
      global.get $assembly/index/w
      i32.mul
      local.get $1
      i32.add
      i32.const 2
      i32.shl
      i32.load
      local.tee $2
      i32.const 1
      i32.and
      if
       local.get $3
       i32.const 14
       i32.and
       i32.const 2
       i32.eq
       if
        global.get $assembly/index/s
        local.get $0
        global.get $assembly/index/w
        i32.mul
        i32.add
        local.get $1
        i32.add
        i32.const 2
        i32.shl
        local.get $2
        i32.const 16777215
        i32.and
        local.get $2
        i32.const 24
        i32.shr_u
        global.get $assembly/index/BIT_ROT
        i32.sub
        local.tee $2
        i32.const 0
        local.tee $3
        local.get $2
        local.get $3
        i32.gt_s
        select
        i32.const 24
        i32.shl
        i32.or
        i32.store
       else        
        global.get $assembly/index/s
        local.get $0
        global.get $assembly/index/w
        i32.mul
        i32.add
        local.get $1
        i32.add
        i32.const 2
        i32.shl
        global.get $assembly/index/BGR_DEAD
        i32.const -16777216
        i32.or
        i32.store
       end
      else       
       local.get $3
       i32.const 3
       i32.eq
       if
        global.get $assembly/index/s
        local.get $0
        global.get $assembly/index/w
        i32.mul
        i32.add
        local.get $1
        i32.add
        i32.const 2
        i32.shl
        global.get $assembly/index/BGR_ALIVE
        i32.const -16777216
        i32.or
        i32.store
       else        
        global.get $assembly/index/s
        local.get $0
        global.get $assembly/index/w
        i32.mul
        i32.add
        local.get $1
        i32.add
        i32.const 2
        i32.shl
        local.get $2
        i32.const 16777215
        i32.and
        local.get $2
        i32.const 24
        i32.shr_u
        global.get $assembly/index/BIT_ROT
        i32.sub
        local.tee $2
        i32.const 0
        local.tee $3
        local.get $2
        local.get $3
        i32.gt_s
        select
        i32.const 24
        i32.shl
        i32.or
        i32.store
       end
      end
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $repeat|1
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $repeat|0
   end
  end
 )
 (func $assembly/index/fill (; 4 ;) (type $FUNCSIG$viid) (param $0 i32) (param $1 i32) (param $2 f64)
  (local $3 i32)
  loop $repeat|0
   block $break|0
    local.get $3
    global.get $assembly/index/w
    i32.ge_s
    br_if $break|0
    call $~lib/math/NativeMath.random
    local.get $2
    f64.lt
    if
     global.get $assembly/index/s
     local.get $1
     global.get $assembly/index/w
     i32.mul
     i32.add
     local.get $3
     i32.add
     i32.const 2
     i32.shl
     global.get $assembly/index/BGR_ALIVE
     i32.const -16777216
     i32.or
     i32.store
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $repeat|0
   end
  end
  i32.const 0
  local.set $3
  loop $repeat|1
   block $break|1
    local.get $3
    global.get $assembly/index/h
    i32.ge_s
    br_if $break|1
    call $~lib/math/NativeMath.random
    local.get $2
    f64.lt
    if
     global.get $assembly/index/s
     local.get $3
     global.get $assembly/index/w
     i32.mul
     i32.add
     local.get $0
     i32.add
     i32.const 2
     i32.shl
     global.get $assembly/index/BGR_ALIVE
     i32.const -16777216
     i32.or
     i32.store
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $repeat|1
   end
  end
 )
 (func $null (; 5 ;) (type $FUNCSIG$v)
  nop
 )
)
