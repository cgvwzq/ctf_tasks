(module
 (memory (import "env" "mem") 0)
 (global $COLS (import "globals" "cols") i32)
 (global $ROWS (import "globals" "rows") i32)
 (global $MIRROR (import "globals" "offset") i32)
 (global $EGG (import "globals" "offset2") i32)
 (data (get_global $EGG) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\00\01\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\00\00\00\00\00\00\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\01\00\00\00\00\01\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\01\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\00\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\00\01\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\01\01\01\01\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
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
 (func $getEasterCell (param $x i32) (param $y i32) (result i32)
  (i32.load8_u
   (i32.add
    (i32.add 
     (i32.mul (get_local $x) (get_global $ROWS))
     (get_local $y)
    )
    (get_global $EGG)
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
  (local $i i32)
  (local $j i32)
  (set_local $j (i32.const 0))
  (loop $l2
   (set_local $i (i32.const 0))
   (loop $l1
    (if (i32.ne 
     (call $getCell (get_local $i) (get_local $j))
     (call $getEasterCell (get_local $i) (get_local $j)))
      (return (i32.const 0)))
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
