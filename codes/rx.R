
mat <- matrix(c(
  0, 57, 21, 3, 21, 0, 0, 21, 153,
  57, 0, 78, 60, 78, 57, 57, 78, 210,
  21, 78, 0, 18, 0, 21, 21, 0, 132,
  3, 60, 18, 0, 18, 3, 3, 18, 150,
  21, 78, 0, 18, 0, 21, 21, 0, 132,
  0, 57, 21, 3, 21, 0, 0, 21, 153,
  0, 57, 21, 3, 21, 0, 0, 21, 153,
  21, 78, 0, 18, 0, 21, 21, 0, 132,
  153, 210, 132, 150, 132, 153, 153, 132, 0
), nrow = 9, byrow = TRUE)


r2=rowSums(mat)/7;r2

mat1 <- matrix(c(
  0, 57, 3, 21, 0, 0, 21, 21,
  57, 0, 60, 78, 57, 57, 78, 78,
  3, 60, 0, 18, 3, 3, 18, 18,
  21, 78, 18, 0, 21, 21, 0, 0,
  0, 57, 3, 21, 0, 0, 21, 21,
  0, 57, 3, 21, 0, 0, 21, 21,
  21, 78, 18, 0, 21, 21, 0, 0,
  21, 78, 18, 0, 21, 21, 0, 0
), nrow = 8, byrow = TRUE)

r3=rowSums(mat1)/6;r3




mat2 <- matrix(c(
  0, 57, 3, 0, 0, 21, 21,
  57, 0, 60, 57, 57, 78, 78,
  3, 60, 0, 3, 3, 18, 18,
  0, 57, 3, 0, 0, 21, 21,
  0, 57, 3, 0, 0, 21, 21,
  21, 78, 18, 21, 21, 0, 0,
  21, 78, 18, 21, 21, 0, 0
), nrow = 7, byrow = TRUE)

# Assign row and column names
rownames(mat) <- c("seq1", "seq2", "seq4", "seq7", "seq8", "new_row1", "new_row2")
colnames(mat) <- c("seq1", "seq2", "seq4", "seq7", "seq8", "new_row1", "new_row2")
r4=rowSums(mat2)/5;r4



mat3 <- matrix(c(
  0, 57, 3, 0, 0, 21,
  57, 0, 60, 57, 57, 78,
  3, 60, 0, 3, 3, 18,
  0, 57, 3, 0, 0, 21,
  0, 57, 3, 0, 0, 21,
  21, 78, 18, 21, 21, 0
), nrow = 6, byrow = TRUE)

r4=rowSums(mat3)/4;r4

mat4 <- matrix(c(
  0, 57, 0, 0, 3,
  57, 0, 57, 57, 60,
  0, 57, 0, 0, 3,
  0, 57, 0, 0, 3,
  3, 60, 3, 3, 0
), nrow = 5, byrow = TRUE)

r5=rowSums(mat4)/4;r5

