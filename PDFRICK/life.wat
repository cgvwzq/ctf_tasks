(module
 (memory (import "env" "mem") 0)
 (global $COLS (import "globals" "cols") i32)
 (global $ROWS (import "globals" "rows") i32)
 (global $MIRROR (import "globals" "offset") i32)
 (global $EGG (import "globals" "offset2") i32)
 (data (get_global $EGG) "\98\00\00\00\ec\b0\ec\b1\ec\ae\ec\af\ec\a8\ec\a9\ec\a6\ec\a7\eb\b1\eb\af\eb\a6\ea\b1\ea\af\ea\a9\e9\b0\e9\b1\e9\ae\e9\af\e9\a8\e9\a9\e9\a6\e9\a7\e7\b0\e7\b1\e7\ae\e7\af\e7\a8\e7\a9\e7\a6\e7\a7\e6\af\e6\a6\e5\ae\e5\a9\e4\af\e4\a8\e4\a9\e4\a6\e4\a7\e3\b0\e3\b1\e3\ae\e3\af\e2\a8\e2\a7\e1\b0\e1\b1\e1\ae\e1\af\e1\a9\e1\a7\e0\b1\e0\af\e0\a6\e0\a7\ff\b1\ff\af\fe\b0\fe\b1\fe\ae\fe\af\fe\a8\fe\a9\fe\a6\fe\a7\fd\a8\fd\a6\fd\a7\fc\b0\fc\af\fc\a8\fc\a7\fb\b0\fb\b1\fb\af\fa\b0\fa\ae\fa\af\fa\a8\fa\a9\fa\a6\fa\a7\f9\a8\f9\a7\f8\b0\f8\b1\f8\ae\f8\af\f8\a9\f8\a6\f6\b0\f6\b1\f6\ae\f6\af\f6\ab\f6\a8\f6\a9\f6\a6\f6\a7\f6\a4\f5\ae\f5\aa\f5\a5\f4\b1\f3\b0\f3\b1\f3\ae\f3\af\f3\a8\f3\a9\f3\a6\f3\a7\f1\b0\f1\b1\f1\ae\f1\af\f1\a7\f1\a4\f0\b0\f0\af\cf\b0\cf\b1\cf\af\cf\a8\cf\a9\cf\a6\cf\a7\ce\b0\ce\b1\ce\af\ce\a7\cd\a6\cc\b2\cc\b0\cc\b1\cc\ae\cc\af\cc\ac\cc\a7\cb\a8\cb\a9\cb\a6\cb\a7\ca\b5\ca\ad\c9\b2\c9\b3\c9\b0\c9\b1\c9\ae\c9\af\c9\ac")
 (import "globals" "cb" (func $cb (param i32)))
 (export "tick" (func $tick))
 (func $tick
  (local $i i32)
  (local $j i32)
  (set_local $j (i32.const 0))
  (loop $l2
   (set_local $i (i32.const 0))
   (loop $l1
   (call $updateCell (get_local $i) (get_local $j))
   (set_local $i
    (i32.add
     (get_local $i)
     (i32.const 1)
    )
   )
   (br_if $l1
    (i32.lt_s
     (get_local $i)
     (get_global $COLS)
    )
   )
  )
  (set_local $j
   (i32.add
    (get_local $j)
    (i32.const 1)
   )
  )
  (br_if $l2
   (i32.lt_s
    (get_local $j)
    (get_global $ROWS)
   )
  )
  )
  ;; move mirror world to real world
  (call $updateWorld)
 )
 (func $getCell (param $x i32) (param $y i32) (result i32)
  (i32.load8_u
   (i32.add 
    (i32.mul (get_local $x) (get_global $ROWS))
    (get_local $y)
   )
  )
 )
 (func $getMirrorCell (param $x i32) (param $y i32) (result i32)
  (i32.load8_u
   (i32.add
    (i32.add 
     (i32.mul (get_local $x) (get_global $ROWS))
     (get_local $y)
    )
    (get_global $MIRROR)
   )
  )
 )
 (func $setCell (param $x i32) (param $y i32) (param $val i32)
  (i32.store8
   (i32.add 
    (i32.mul (get_local $x) (get_global $ROWS))
    (get_local $y)
   )
   (get_local $val)
  )
 )
 (func $setMirrorCell (param $x i32) (param $y i32) (param $val i32)
  (i32.store8
   (i32.add
    (i32.add 
     (i32.mul (get_local $x) (get_global $ROWS))
     (get_local $y)
    )
    (get_global $MIRROR)
   )
   (get_local $val)
  )
 )
 (func $countNeighbours (param $x i32) (param $y i32) (result i32)
  (local $neighbour i32)
  (set_local $neighbour (i32.const 0))
  ;; if (x>0) n += left
  (if (i32.gt_u (get_local $x) (i32.const 0))
   (block
   (if (call $getCell (i32.sub (get_local $x) (i32.const 1)) (get_local $y))
     (set_local $neighbour (i32.add (get_local $neighbour) (i32.const 1)))
   )
   ;; if (x>0 & y>0) n += bot-left
   (if (i32.gt_u (get_local $y) (i32.const 0))
    (if (call $getCell (i32.sub (get_local $x) (i32.const 1)) (i32.sub (get_local $y) (i32.const 1)))
      (set_local $neighbour (i32.add (get_local $neighbour) (i32.const 1)))
    )
   )
   ;; if (x>0 & y<ROWS) n += top-left
   (if (i32.lt_u (get_local $y) (get_global $ROWS))
    (if (call $getCell (i32.sub (get_local $x) (i32.const 1)) (i32.add (get_local $y) (i32.const 1)))
      (set_local $neighbour (i32.add (get_local $neighbour) (i32.const 1)))
    )
   )
   )
  )
  ;; if (x<COLS) n += right
  (if (i32.lt_u (get_local $x) (get_global $COLS))
   (block
   (if (call $getCell (i32.add (get_local $x) (i32.const 1)) (get_local $y))
     (set_local $neighbour (i32.add (get_local $neighbour) (i32.const 1)))
   )
   ;; if (x<COLS & y>0) n += bot-right
   (if (i32.gt_u (get_local $y) (i32.const 0))
    (if (call $getCell (i32.add (get_local $x) (i32.const 1)) (i32.sub (get_local $y) (i32.const 1)))
      (set_local $neighbour (i32.add (get_local $neighbour) (i32.const 1)))
    )
   )
   ;; if (x<COLS & y<ROWS) n += top-right
   (if (i32.lt_u (get_local $y) (get_global $ROWS))
    (if (i32.gt_u
     (call $getCell (i32.add (get_local $x) (i32.const 1)) (i32.add (get_local $y) (i32.const 1)))
     (i32.const 0))
      (set_local $neighbour (i32.add (get_local $neighbour) (i32.const 1)))
    )
   )
   )
  )
  ;; if (y>0) n += bottom
  (if (i32.gt_u (get_local $y) (i32.const 0))
   (if (call $getCell (get_local $x) (i32.sub (get_local $y) (i32.const 1)))
     (set_local $neighbour (i32.add (get_local $neighbour) (i32.const 1)))
   )
  )
  ;; if (y<ROWS) n += top
  (if (i32.lt_u (get_local $y) (get_global $ROWS))
   (if (call $getCell (get_local $x) (i32.add (get_local $y) (i32.const 1)))
     (set_local $neighbour (i32.add (get_local $neighbour) (i32.const 1)))
   )
  )
  ;; return 
  (get_local $neighbour)
 )
 (func $updateCell (param $x i32) (param $y i32)
  ;; apply rules and update mirror cell
  (local $n i32)
  ;; if cell is alive
  (set_local $n (call $countNeighbours (get_local $x) (get_local $y)))
  (if (call $getCell (get_local $x) (get_local $y))
    (block
     ;; Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
     (if (i32.lt_u (get_local $n) (i32.const 2))
      (block 
      (call $setMirrorCell (get_local $x) (get_local $y) (i32.const 0))
      (return)))
     ;; Any live cell with more than three live neighbours dies, as if by overpopulation.
     (if (i32.gt_u (get_local $n) (i32.const 3))
      (block 
      (call $setMirrorCell (get_local $x) (get_local $y) (i32.const 0))
      (return)))
     ;; Any live cell with two or three live neighbours lives on to the next generation.
     (call $setMirrorCell (get_local $x) (get_local $y) (i32.const 1))
     (return)
    )
   ;; Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
   (if (i32.eq (get_local $n) (i32.const 3))
    (call $setMirrorCell (get_local $x) (get_local $y) (i32.const 1)))
  )
 )
 (func $check (result i32)
  (local $length i32)
  (local $i i32)
  (set_local $i (i32.const 4))
  (set_local $length (i32.load (get_global $EGG)))
  (loop $l
   (if (i32.ne (i32.const 1) (call $getCell
    (i32.xor
     (i32.load8_u (i32.add (i32.add (get_local $i) (i32.const 0)) (get_global $EGG)))
     (i32.const 0xef))
    (i32.xor 
     (i32.load8_u (i32.add (i32.add (get_local $i) (i32.const 1)) (get_global $EGG)))
     (i32.const 0xbe))))
     (return (i32.const 0)))
   (set_local $i
    (i32.add
     (get_local $i)
     (i32.const 2)
    )
   )
   (br_if $l
    (i32.lt_s
     (get_local $i)
     (get_local $length)
    )
   )
  )
  (return (i32.const 1))
 )
 (func $updateWorld
  (local $i i32)
  (local $j i32)
  (set_local $j (i32.const 0))
  (loop $l2
   (set_local $i (i32.const 0))
   (loop $l1
   (call $setCell (get_local $i) (get_local $j)
    (call $getMirrorCell (get_local $i) (get_local $j)))
   (set_local $i
    (i32.add
     (get_local $i)
     (i32.const 1)
    )
   )
   (br_if $l1
    (i32.lt_s
     (get_local $i)
     (get_global $COLS)
    )
   )
  )
  (set_local $j
   (i32.add
    (get_local $j)
    (i32.const 1)
   )
  )
  (br_if $l2
   (i32.lt_s
    (get_local $j)
    (get_global $ROWS)
   )
  )
  )
  (if (call $check)
   (call $cb (i32.const 0xde)))
 )
)
