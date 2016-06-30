#include <Rcpp.h>

using namespace Rcpp;

//' Personal hash function
//'
//' @param x character vector of strings to hash
//' @return numeric vector of the hashes of \code{x}
//' @export
//[[Rcpp::export]]
std::vector < unsigned int > sdbm_hash(std::vector < std::string> x) {

  unsigned int input_size = x.size();
  std::vector < unsigned int > output(input_size);

  unsigned char *str;
  unsigned int hash;
  int c;

  for (unsigned int i=0; i<input_size; i++) {

    if ((i % 10000) == 0) Rcpp::checkUserInterrupt();

    str = (unsigned char *)x[i].c_str();
    hash = 0;

    while ((c = *str++)) hash = c + (hash << 6) + (hash << 16) - hash;

    output[i] = hash;

  }

  return(output);

}
