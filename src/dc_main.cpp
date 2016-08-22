#include "dyn_con.h"
#include <iostream>

using namespace ogdf;
using namespace std;

int main() {
    DCGraph G;

    node nodes[100];
    for (int i = 0; i < 100; i++) {
        nodes[i] = G.newNode();
    }

    edge edges[100][100];
    for (int i = 0; i < 100; i++) {
        edges[i][(i+1) % 100] = G.newEdge(nodes[i], nodes[(i+1) % 100]);
    }

    dyn_con dc(G);
    edge e = dc.ins(nodes[0], nodes[10]);

    if (dc.connected(nodes[17], nodes[42])) {
        cout << "This is the right answer" << endl;
    } else {
        cout << "Hups!" << endl;
    }

    dc.del(e);
    dc.print_statistics(cout);

    return 0;
}
