fn main() {
    // let mut arr = [18, 36, 2, 69, 42, 80, 90, 83, 61, 70, 37, 67, 84, 90, 58, 10, 23, 42, 62, 48, 49, 58, 86, 1, 65, 20, 20, 26, 91, 8, 50, 28, 9, 59, 76, 96, 49, 54, 55, 8, 20, 90, 64, 81, 53, 75, 52, 8, 64, 52, 63, 39, 5, 83, 81, 2, 36, 41, 66, 81, 87, 36, 84, 8, 5, 27, 32, 46, 80, 62, 94, 39, 99, 15, 81, 96, 74, 78, 78, 11, 30, 8, 18, 70, 56, 5, 42, 10, 2, 50, 6, 66, 69, 9, 58, 73, 43, 79, 47, 67];
    let mut arr = [9, 4, 13, 2, 22, 17, 8, 9, 10];

    let end = arr.len() - 1;    
    quicksort(&mut arr[..], 0, end);

    println!("Sorted array:");ZZ
    print_arr(&arr[..]);
}

fn quicksort(arr: &mut[i32], start:usize, end:usize) {
    if start > end {
        return;
    }

    println!("quicksorting");

    println!("start {} end {}", start, end);

    let p = partition(arr, start, end);
    print_arr(&arr[..]);
    println!("partition {}", p);
    if p == 0 {
        return;
    }
    quicksort(arr, start, p-1);
    quicksort(arr, p+1, end);
}

fn partition(arr: &mut[i32], start:usize, end:usize) -> usize {
    println!("partitioning");

    if end <= start {
        return end;
    }

    let pivot = end;
    let mut i = start;
    println!("pivot: arr[{}]: {}", pivot, arr[pivot]);
    for j in start..end {
        println!("j: arr[{}]: {}", j, arr[j]);
        if arr[j] <= arr[pivot] {
            arr.swap(i, j);
            i += 1;
        }
    }
    arr.swap(i, end);

    return i;
    // return end;
}

fn print_arr(a: &[i32]) -> () {
    for i in a {
        print!("{} ", i);
    }
    println!("");
}
