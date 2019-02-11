// BST
#include<stdio.h>
#include<stdlib.h>

struct BST
{
    int data;
    struct BST *next, *prev;
};

struct BST * create(int val)
{
    struct BST *temp = (struct BST*)malloc(sizeof(struct BST));
    temp -> data = val;
    temp -> next = NULL;
    temp -> prev = NULL;
}

void insert(struct BST *root, struct BST *temp)
{
    if((root -> data > temp -> data))
    {
        if(root -> next == NULL)
            root -> next = temp;
        else
            insert(root -> next, temp);
    }
    else
    {
        if(root -> prev == NULL)
            root -> prev = temp;
        else
            insert(root -> prev, temp);
    }
}

void display(struct BST * root)
{
    printf("%d ", root -> data);
    if(root -> prev != NULL)
        display(root -> prev);
    if(root -> next != NULL)
        display(root -> next);
}

int main(int argc, char const *argv[])
{
    struct BST * root = NULL;
    root = create(1);
    char ch = 'y';
    int choice, a;
    while(ch == 'y' || ch == 'Y')
    {
        printf("Choose:\n1. Insert\n2. Display BST\n");
        scanf("%d", &choice);
        switch(choice)
        {
            case 1: printf("Please enter the data: ");
                    scanf("%d", &a);
                    struct BST * f = create(a);
                    insert(root, f);
                    break;

            case 2: display(root);
                    break;

            default:printf("Please enter a correct choice\n");
        }
        printf("Do you want to try again[y/N] ?\n");
        scanf(" %c", &ch);
    }
    return 0;
}
