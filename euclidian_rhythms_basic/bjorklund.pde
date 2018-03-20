int[] build(int level, int[] bitmap, int[]counts, int[] remainders){
    switch(level){
      case -1:
        bitmap = append(bitmap, 0);
        break;
      case -2:
        bitmap = append(bitmap, 1);
        break;
      default:
        for(int i=0; i< counts[level]; i++){
          bitmap = build(level -1, bitmap, counts, remainders);
        }
        if (remainders[level] != 0) {
          bitmap = build(level-2, bitmap, counts, remainders);
        }
        break;
    }
    
    return bitmap;
  }
  
int[] bjorklund(int num_steps, int num_pulses){
  int[] bitmap = new int[0];
  int[] counts = new int[0];
  int[] remainders = new int[0];
  int level = 0;
  int divisor = num_steps - num_pulses;
  remainders = append(remainders, num_pulses);
 
  while (true){
    counts = append(counts, divisor / remainders[level]);
    remainders = append(remainders, divisor % remainders[level]);
    divisor = remainders[level];
    level = level + 1;
    if (remainders[level] <= 1){
      break;
    }
  }
  counts = append(counts, divisor);
  
  
  bitmap = build(level, bitmap, counts, remainders);
  
  int index = num_steps-1;
  
  for(int i=num_steps-1; i>-1;i--){
    if(bitmap[i] == 1){
      index = min(index, i);
    }
  }
  int[] new_bitmap = bitmap;
  for(int i=0; i<num_steps-index; i++){
    new_bitmap[i] = bitmap[i+index];
  }
  for(int i=0; i< index; i++){
    new_bitmap[i+num_steps-index] = bitmap[i];
  }
  return new_bitmap;
}
