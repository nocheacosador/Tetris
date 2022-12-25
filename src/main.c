#include <stdio.h>
#include <curses.h>

int main(int argc, char** argv)
{
    initscr();
    mvaddstr(10, 10, "Hello from main\n");
    getch();
    endwin();
}