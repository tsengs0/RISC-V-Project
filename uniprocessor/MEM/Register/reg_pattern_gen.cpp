#include <iostream>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

int main(int argc, char **argv)
{
	char temp[64], id;
	char cmd[100];
	
	//system("echo \"\"  > RegRead_pattern.mem");
	//system("echo \"\"  > RegWrite_pattern.mem");

	for(int i = 0; i < 32; i++) {
		if((i%16) <= 9) {
			for(int j = 0; j < 16; j++)
				sprintf(temp + j, "%d", (i%16));
		}
		else {
			switch((i%16)) {
				case 10: 
					id = 'A'; 
					break;
				case 11: 
					id = 'B'; 
					break;
				case 12: 
					id = 'C'; 
					break;
				case 13: 
					id = 'D'; 
					break;
				case 14: 
					id = 'E'; 
					break;
				case 15: 
					id = 'F'; 
					break;
				default:
					id = 'A';
					break;

			}

			for(int j = 0; j < 16; j++)
				sprintf(temp + j, "%c", id);
		}
		//cout << temp << endl;
		for(int i = 0; i < 6; i++) sprintf(cmd, "echo \"");
		for(int i = 0; i < 16; i++) sprintf(cmd + 6 + i, "%c", temp[i]);
		for(int i = 0; i < 24; i++) sprintf(cmd + 6 + 16, "\" >> RegRead_pattern.mem");
		//cout << cmd << endl; 
		system(cmd);
	}

	for(int i = 0; i < 32; i++) {
		if((i%16) <= 9) {
			for(int j = 0; j < 16; j++)
				sprintf(temp + j, "%d", (rand() % 10));
		}
		else {
			switch((rand() % 6) + 10) {
				case 10: 
					id = 'A'; 
					break;
				case 11: 
					id = 'B'; 
					break;
				case 12: 
					id = 'C'; 
					break;
				case 13: 
					id = 'D'; 
					break;
				case 14: 
					id = 'E'; 
					break;
				case 15: 
					id = 'F'; 
					break;
				default:
					id = 'A';
					break;

			}

			for(int j = 0; j < 16; j++)
				sprintf(temp + j, "%c", id);
		}
		//cout << temp << endl;
		for(int i = 0; i < 6; i++) sprintf(cmd, "echo \"");
		for(int i = 0; i < 16; i++) sprintf(cmd + 6 + i, "%c", temp[i]);
		for(int i = 0; i < 24; i++) sprintf(cmd + 6 + 16, "\" >> RegWrite_pattern.mem");
		//cout << cmd << endl; 
		system(cmd);
	}

	return 0;
}
