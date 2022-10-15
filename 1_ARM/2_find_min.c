//find the minimum
#include<stdio.h>
int main(){
	int n;
	scanf("%d", &n);
	int min_num;
	int a;
	scanf("%d", &a);
	min_num = a;
	int i = 1;
	while(i < n){
		scanf("%d", &a);
		if(a < min_num){
			min_num = a;
		}
		i++;
	}
	printf("min num: %d\n", min_num);
	return 0;
}