--module(..., package.seeall);

g_bIsDebug   = false
g_bIsEnvProd = false

-- -------------------------------------------------------------------------
-- Method PresentString
--
-- This method presents a given string to the user.
-- -------------------------------------------------------------------------
function PresentString(a_strItem)

  if (g_bIsEnvProd) then
    DEFAULT_CHAT_FRAME:AddMessage(a_strItem)
  else
    print(a_strItem)
  end
end


-- ===========================================================================
-- Class TContainerFactory
--
-- This class defines a container factory.
-- ===========================================================================
do
  -- =========================================================================
  -- Class TQueue
  --
  -- This class defines a queue.
  -- =========================================================================
  do
  -- -------------------------------------------------------------------------
  -- Method IsEmpty
  --
  -- This method returns true when the queue is empty or false otherwise.
  -- -------------------------------------------------------------------------
    local function IsEmpty(self)
      if (g_bIsDebug) then PresentString("+TQueue:IsEmpty") end
      if (g_bIsDebug) then PresentString("-TQueue:IsEmpty") end

      return (#self.m_vecItems == 0)
    end

  -- -------------------------------------------------------------------------
  -- Method Dequeue
  --
  -- This method returns the oldest item in the queue.
  -- -------------------------------------------------------------------------
    local function Pop(self)
      if (g_bIsDebug) then PresentString("+TQueue:Dequeue") end

      local Item

      if (self:IsEmpty() == "false") then
        Item = self.m_vecItems[1]
        table.remove(self.m_vecItems, 1)
      end

      if (g_bIsDebug) then PresentString("-TQueue:Dequeue") end
      return Item
    end

  -- -------------------------------------------------------------------------
  -- Method Enqueue
  --
  -- This method places an item on the queue.
  -- -------------------------------------------------------------------------
    local function Enqueue(self, a_Item)
      if (g_bIsDebug) then PresentString("+TQueue:Enqueue") end
      if (g_bIsDebug) then PresentString("-TQueue:Enqueue") end
      table.insert(self, a_Item)
    end

  -- -------------------------------------------------------------------------
  -- Method GetType
  --
  -- This method returns the type of this class.
  -- -------------------------------------------------------------------------
     local function GetType()
      if (g_bIsDebug) then PresentString("+TQueue:GetType") end
      if (g_bIsDebug) then PresentString("-TQueue:GetType") end
       return "TQueue"
     end

  -- -------------------------------------------------------------------------
  -- Method new_TQueue
  --
  -- This method creates an object of this class.
  -- -------------------------------------------------------------------------
    function new_TQueue()
      if (g_bIsDebug) then PresentString("+new_TQueue") end

      local obj =
      {
        GetType    = GetType,
        IsEmpty    = IsEmpty,
        Dequeue    = Dequeue,
        Enqueue    = Enqueue,
        m_vecItems = {},
      }

      if (g_bIsDebug) then PresentString("-new_TQueue") end
      return obj
    end
  end

  -- =========================================================================
  -- Class TStack
  --
  -- This class defines a stack.
  -- =========================================================================
  do
  -- -------------------------------------------------------------------------
  -- Method IsEmpty
  --
  -- This method returns true when the stack is empty or false otherwise.
  -- -------------------------------------------------------------------------
    local function IsEmpty(self)
      if (g_bIsDebug) then PresentString("+TStack:IsEmpty") end
      if (g_bIsDebug) then PresentString("-TStack:IsEmpty") end

      return (#self.m_vecItems == 0)
    end

  -- -------------------------------------------------------------------------
  -- Method Pop
  --
  -- This method returns the most recently stacked item.
  -- -------------------------------------------------------------------------
    local function Pop(self)
      if (g_bIsDebug) then PresentString("+TStack:Pop") end

      local Item

      if (self:IsEmpty() == "false") then
        Item = self.m_vecItems[#self.m_vecItems]
        table.remove(self.m_vecItems)
      end

      if (g_bIsDebug) then PresentString("-TStack:Pop") end
      return Item
    end

  -- -------------------------------------------------------------------------
  -- Method Push
  --
  -- This method places an item on the stack.
  -- -------------------------------------------------------------------------
    local function Push(self, a_Item)
      if (g_bIsDebug) then PresentString("+TStack:Push") end
      if (g_bIsDebug) then PresentString("-TStack:Push") end
      table.insert(self, a_Item)
    end

  -- -------------------------------------------------------------------------
  -- Method GetType
  --
  -- This method returns the type of this class.
  -- -------------------------------------------------------------------------
     local function GetType()
      if (g_bIsDebug) then PresentString("+TStack:GetType") end
      if (g_bIsDebug) then PresentString("-TStack:GetType") end
       return "TStack"
     end

  -- -------------------------------------------------------------------------
  -- Method new_TStack
  --
  -- This method creates an object of this class.
  -- -------------------------------------------------------------------------
    function new_TStack()
      if (g_bIsDebug) then PresentString("+TStack:new_TStack") end

      local obj =
      {
        GetType    = GetType,
        IsEmpty    = IsEmpty,
        Pop        = Pop,
        Push       = Push,
        m_vecItems = {},
      }

      if (g_bIsDebug) then PresentString("-TStack:new_TStack") end
      return obj
    end
  end

  -- ===========================================================================
  -- Class TNumberMultiMap
  --
  -- This class encapsulates a map of weakly sorted key / value pairs.
  -- ===========================================================================
  do
  -- ---------------------------------------------------------------------------
  -- Function SortByKeys
  --
  -- This function returns true if the key in the first given table is less than
  -- the key in the second given table.
  -- ---------------------------------------------------------------------------
    local function SortByKeys(a_tblFirst, a_tblSecond)
      if (type(a_tblFirst)       ~= "table")  then error("Variable 'a_tblFirst' is not a table.",        0) end
      if (type(a_tblSecond)      ~= "table")  then error("Variable 'a_tblSecond' is not a table.",       0) end
      if (type(a_tblFirst.nKey)  ~= "number") then error("Variable 'a_tblFirst.nKey' is not a number.",  0) end
      if (type(a_tblSecond.nKey) ~= "number") then error("Variable 'a_tblSecond.nKey' is not a number.", 0) end

      return a_tblFirst.nKey < a_tblSecond.nKey
    end


  -- ---------------------------------------------------------------------------
  -- Method Add
  --
  -- This method adds a given key value pair (a_nKey, a_nValue) to the map of
  -- pairs where the map is weakly sorted by keys.
  -- ---------------------------------------------------------------------------
    local function Add(self, a_nKey, a_nValue)
      if (g_bIsDebug) then PresentString("+TNumberMultiMap:Add") end

      if (type(a_nKey)   ~= "number") then error("Variable 'a_nKey' is not a number.",   0) end
      if (type(a_nValue) ~= "number") then error("Variable 'a_nValue' is not a number.", 0) end

      table.insert(self.m_tblPairs, { nKey = a_nKey, nValue = a_nValue, })
      table.sort(self.m_tblPairs, SortByKeys)

      if (g_bIsDebug) then PresentString("-TNumberMultiMap:Add") end
    end


  -- ---------------------------------------------------------------------------
  -- Method GetType
  --
  -- This method returns the type of this class.
  -- ---------------------------------------------------------------------------
    local function GetType()
      return "TNumberMultiMap"
    end


  -- ---------------------------------------------------------------------------
  -- Method new_TNumberMultiMap
  --
  -- This method creates an object of this class.
  -- ---------------------------------------------------------------------------
    function new_TNumberMultiMap()
      if (g_bIsDebug) then PresentString("+new_TNumberMultiMap") end

      local obj =
      {
        GetType    = GetType,
        Add        = Add,
        m_tblPairs = {},
      }

      if (g_bIsDebug) then PresentString("-new_TNumberMultiMap") end
      return obj
    end
  end


  -- ===========================================================================
  -- Class TNumberMap
  --
  -- This class encapsulates a map of weakly sorted key / value pairs.
  -- ===========================================================================
  do
  -- ---------------------------------------------------------------------------
  -- Function SortByKeys
  --
  -- This function returns true if the key in the first given table is less than
  -- the key in the second given table.
  -- ---------------------------------------------------------------------------
    local function SortByKeys(a_tblFirst, a_tblSecond)
      if (type(a_tblFirst)       ~= "table")  then error("Variable 'a_tblFirst' is not a table.",        0) end
      if (type(a_tblSecond)      ~= "table")  then error("Variable 'a_tblSecond' is not a table.",       0) end
      if (type(a_tblFirst.nKey)  ~= "number") then error("Variable 'a_tblFirst.nKey' is not a number.",  0) end
      if (type(a_tblSecond.nKey) ~= "number") then error("Variable 'a_tblSecond.nKey' is not a number.", 0) end

      return a_tblFirst.nKey < a_tblSecond.nKey
    end


  -- ---------------------------------------------------------------------------
  -- Method Add
  --
  -- This method adds a given key value pair (a_nKey, a_nValue) to the map of
  -- pairs where the map is weakly sorted by keys.
  -- ---------------------------------------------------------------------------
    local function Add(self, a_nKey, a_nValue)
      if (g_bIsDebug) then PresentString("+TNumberMap:Add(",a_nKey, a_nValue,")") end

      if (type(a_nKey)   ~= "number") then error("Variable 'a_nKey' is not a number.",   0) end
      if (type(a_nValue) ~= "number") then error("Variable 'a_nValue' is not a number.", 0) end

      local bIsFound = "false"

      for nIndex, tblPairs in ipairs(self.m_tblPairs) do
        if       (type(tblPairs)        == "table")  then
          if     (type(tblPairs.nKey)   == "number") then
            if   (type(tblPairs.nValue) == "number") then
              if (tblPairs.nKey         == a_nKey)   then
                bIsFound = "true"
                self.m_tblPairs[nIndex].nValue = a_nValue
              end
            end
          end
        end
      end

      if ("false" == bIsFound) then
        table.insert(self.m_tblPairs, { nKey = a_nKey, nValue = a_nValue, })
        table.sort(self.m_tblPairs, SortByKeys)
      end

      if (g_bIsDebug) then PresentString("-TNumberMap:Add") end
    end


  -- ---------------------------------------------------------------------------
  -- Method GetType
  --
  -- This method returns the type of this object
  -- ---------------------------------------------------------------------------
    local function GetType()
      return "TNumberMap"
    end


  -- ---------------------------------------------------------------------------
  -- Method new_TNumberMap
  --
  -- This method creates an object of this class.
  -- ---------------------------------------------------------------------------
    function new_TNumberMap()
      if (g_bIsDebug) then PresentString("+new_TNumberMap") end

      local obj =
      {
        Add        = Add,
        GetType    = GetType,
        m_tblPairs = {},
      }

      if (g_bIsDebug) then PresentString("-new_TNumberMap") end
      return obj
    end

  -- ---------------------------------------------------------------------------
  -- Method new_TNumberMapFromTNumberMultiMap
  --
  -- This method creates an object of this class given a number multi map.
  -- Note: the last duplicate sorted key value is preserved.
  -- ---------------------------------------------------------------------------
    function new_TNumberMapFromTNumberMultiMap(a_tblNumberMultiMap)
      if (g_bIsDebug) then PresentString("+new_TNumberMapFromNumberMultiMap(a_tblNumberMultiMap)") end

      if (type(a_tblNumberMultiMap)            ~= "table") then error("Variable 'a_tblNumberMultiMap' is not a table.",            0) end
      if (type(a_tblNumberMultiMap.m_tblPairs) ~= "table") then error("Variable 'a_tblNumberMultiMap.m_tblPairs' is not a table.", 0) end

      local obj = new_TNumberMap()

      for nI, tblPairs in ipairs(a_tblNumberMultiMap.m_tblPairs) do
        if           (type(tblPairs)        == "table")  then
          if         (type(tblPairs.nKey)   == "number") then
            if       (type(tblPairs.nValue) == "number") then
              if     (type(a_tblNumberMultiMap.m_tblPairs[nI+1])      == "table")  then
                if   (type(a_tblNumberMultiMap.m_tblPairs[nI+1].nKey) == "number") then
                  if (a_tblNumberMultiMap.m_tblPairs[nI].nKey ~= a_tblNumberMultiMap.m_tblPairs[nI+1].nKey) then
                    obj:Add(tblPairs.nKey, tblPairs.nValue)
                  end
                end
              else
                if (type(a_tblNumberMultiMap.m_tblPairs[nI+1]) == "nil") then
                  obj:Add(tblPairs.nKey, tblPairs.nValue)
                end
              end
            end
          end
        end
      end

      if (g_bIsDebug) then PresentString("-new_TNumberMapFromTNumberMultiMap") end
      return obj
    end
  end

  -- =========================================================================
  -- Class TNumberMatrix
  --
  -- This class encapsulates a matrix of numbers.
  -- =========================================================================
  do
  -- -------------------------------------------------------------------------
  -- Function SortByKeys
  --
  -- This function returns true if the key in the first given table is less than
  -- the key in the second given table.
  -- -------------------------------------------------------------------------
    local function SortByKeys(a_tblFirst, a_tblSecond)
      if (type(a_tblFirst)            ~= "table")  then error("Variable 'a_tblFirst' is not a table.",             0) end
      if (type(a_tblFirst.tblKey)     ~= "table")  then error("Variable 'a_tblFirst.tblKey' is not a table.",      0) end
      if (type(a_tblFirst.tblKey.nI)  ~= "number") then error("Variable 'a_tblFirst.tblKey.nI' is not a number.",  0) end
      if (type(a_tblFirst.tblKey.nJ)  ~= "number") then error("Variable 'a_tblFirst.tblKey.nJ' is not a number.",  0) end
      if (type(a_tblSecond)           ~= "table")  then error("Variable 'a_tblSecond' is not a table.",            0) end
      if (type(a_tblSecond.tblKey)    ~= "table")  then error("Variable 'a_tblSecond.tblKey' is not a table.",     0) end
      if (type(a_tblSecond.tblKey.nI) ~= "number") then error("Variable 'a_tblSecond.tblKey.nI' is not a number.", 0) end
      if (type(a_tblSecond.tblKey.nJ) ~= "number") then error("Variable 'a_tblSecond.tblKey.nJ' is not a number.", 0) end

      local bValue = false

      if (a_tblFirst.tblKey.nI < a_tblSecond.tblKey.nI) then
        bValue = true
      else
        if   (a_tblFirst.tblKey.nI == a_tblSecond.tblKey.nI) then
          if (a_tblFirst.tblKey.nJ <  a_tblSecond.tblKey.nJ) then
            bValue = true
          end
        end
      end

      return bValue
    end

  -- -------------------------------------------------------------------------
  -- Method SortPairs
  --
  -- This method sorts the key/value pairs by the keys.
  -- -------------------------------------------------------------------------
    local function SortPairs(self)
      if (g_bIsDebug) then PresentString("+TNumberMatrix:SortPairs") end
      if (g_bIsDebug) then PresentString("-TNumberMatrix:SortPairs") end
      table.sort(self.m_tblPairs, SortByKeys)
    end

  -- -------------------------------------------------------------------------
  -- Method IsInRowEchelonForm
  --
  -- This returns true if
  -- (a) All rows that contain only zeros are grouped at the bottom of the
  --     matrix
  -- (b) For each row that does not contain only zeros, the pivot appears to
  --     the right of the pivot of all rows that appear above.
  -- -------------------------------------------------------------------------
    local function IsInRowEchelonForm(self)
      if (g_bIsDebug) then PresentString("+TNumberMatrix:IsInRowEchelonForm") end

      local nPivotColumn     = 0
      local bIsFoundAllZeros = true
      local nRowAllZeros     = 0


  -- Find the first row of all zeros

      for nI = 1, #self.m_tblIndex do
        bIsFoundAllZeros = true

        for nJ = 1, #self.m_tblIndex[1] do
          if (self.m_tblPairs[self.m_tblIndex[nI][nJ]].nValue ~= 0) then
            bIsFoundAllZeros = false
          end
        end

        if (bIsFoundAllZeros) then
          nRowAllZeros = nI
          break
        end
      end


  -- If the first row of all zeros was found, check all rows below for all zeros.

      if (nRowAllZeros > 0) then
        for   nI = nRowAllZeros, #self.m_tblIndex    do
          for nJ = 1,            #self.m_tblIndex[1] do
            if (self.m_tblPairs[self.m_tblIndex[nI][nJ]].nValue ~= 0) then return "false" end
          end
        end
      end


   -- Check the pivot is to the right of all pivots above.

      for   nI = 1, #self.m_tblIndex    do
        for nJ = 1, #self.m_tblIndex[1] do
          if (self.m_tblPairs[self.m_tblIndex[nI][nJ]].nValue ~= 0) then
            if (nPivotColumn >= nJ) then return false end
            nPivotColumn = nJ
          end
        end
      end

      if (g_bIsDebug) then PresentString("-TNumberMatrix:IsInRowEchelonForm") end
      return true
    end


  -- -------------------------------------------------------------------------
  -- Method IsSquare
  --
  -- This method returns true when the positive
  -- number of rows equals the number of columns.
  -- -------------------------------------------------------------------------
    local function IsSquare(self)
      if (g_bIsDebug) then print("+TNumberMatrix:IsSquare()") end

      local bIsSquare = false

      if (#self.m_tblIndex == #self.m_tblIndex[1]) then bIsSquare = true end
      if (g_bIsDebug) then print("-TNumberMatrix:IsSquare()") end
      return bIsSquare
    end


  -- -------------------------------------------------------------------------
  -- Method Is2x2
  --
  -- This method returns true when there are 2 rows and 2 columns
  -- in the matrix.
  -- -------------------------------------------------------------------------
    local function Is2x2(self)
      if (g_bIsDebug) then print("+TNumberMatrix:Is2x2()") end

	   local bIs2x2 = false

	   if (2 == #self.m_tblIndex) then
	     if (2 == #self.m_tblIndex[1]) then
		   bIs2x2 = true
		 end
	   end

      if (g_bIsDebug) then print("+TNumberMatrix:Is2x2()") end
	  return bIs2x2
	end

  -- -------------------------------------------------------------------------
  -- Method GetDeterminantOf2x2Matrix
  --
  -- This method returns the determinant of a 2 by 2 matrix.
  -- -------------------------------------------------------------------------
    local function GetDeterminantOf2x2Matrix(self)
      if (g_bIsDebug) then print("+TNumberMatrix:GetDeterminantOf2x2Matrix()") end

      if (false == IsSquare(self)) then error("The determinant cannot be calculated because the given matrix is not square.", 0) end
	  if (false == Is2x2(self))    then error("The determinant is only currently implemented for a 2x2 matrix.",              0) end

	  local numDeterminant = 0

	  numDeterminant = self.m_tblPairs[self.m_tblIndex[1][1]].nValue * self.m_tblPairs[self.m_tblIndex[2][2]].nValue - self.m_tblPairs[self.m_tblIndex[2][1]].nValue * self.m_tblPairs[self.m_tblIndex[1][2]].nValue


      if (g_bIsDebug) then print("-TNumberMatrix:GetDeterminantOf2x2Matrix()") end
	  return numDeterminant
	end


  -- -------------------------------------------------------------------------
  -- Method SetValue
  --
  -- This method assigns the given value to the matrix element indexed by the
  -- given row and given column.
  -- -------------------------------------------------------------------------
    local function SetValue(self, a_nRow, a_nCol, a_nValue)
      if (g_bIsDebug) then print("+TNumberMatrix:SetValue(",a_nRow, a_nCol, a_nValue,")") end

      if (type(a_nRow)   ~= "number")   then error("Variable 'a_nRow' is not a number.",                             0) end
      if (type(a_nCol)   ~= "number")   then error("Variable 'a_nCol' is not a number.",                             0) end
      if (type(a_nValue) ~= "number")   then error("Variable 'a_nValue' is not a number.",                           0) end
      if (a_nRow < 1)                   then error("Variable 'a_nRow' is less than one.",                            0) end
      if (a_nRow > #self.m_tblIndex)    then error("Variable 'a_nRow' exceeds the number of rows in the matrix.",    0) end
      if (a_nCol < 1)                   then error("Variable 'a_nCol' is less than one.",                            0) end
      if (a_nCol > #self.m_tblIndex[1]) then error("Variable 'a_nCol' exceeds the number of columns in the matrix.", 0) end

      if (type(self.m_tblPairs[self.m_tblIndex[a_nRow][a_nCol]]) == "nil") then error("The matrix element is 'nil'.", 0) end

      self.m_tblPairs[self.m_tblIndex[a_nRow][a_nCol]].nValue = a_nValue

      if (g_bIsDebug) then print("-TNumberMatrix:SetValue") end
    end


  -- -------------------------------------------------------------------------
  -- Method GetColVector
  --
  -- This method returns a 1xn_matrix of the given column.
  -- -------------------------------------------------------------------------
    local function GetColVector(self, a_nCol)
      if (g_bIsDebug) then PresentString("+TNumberMatrix:GetColVector(", a_nCol, ")") end

      if (type(a_nCol) ~= "number")             then error("Variable 'a_nCol' is not a number.",                             0) end
      if (a_nCol        <  1)                   then error("Variable 'a_nCol' is less than one.",                            0) end
      if (a_nCol        >  #self.m_tblIndex[1]) then error("Variable 'a_nCol' exceeds the number of columns in the matrix.", 0) end

      local matColVector = new_TNumberMatrix(#self.m_tblIndex, 1)

      for nRow = 1, #self.m_tblIndex do
        matColVector:SetValue(nRow, 1, self.m_tblPairs[self.m_tblIndex[nRow][a_nCol]].nValue)
      end

      if (g_bIsDebug) then PresentString("-TNumberMatrix:GetColVector(", a_nCol, ")") end
      return matColVector
    end

  -- -------------------------------------------------------------------------
  -- Method GetRowVector
  --
  -- This method returns a 1xn_matrix of the given row.
  -- -------------------------------------------------------------------------
    local function GetRowVector(self, a_nRow)
      if (g_bIsDebug) then PresentString("+TNumberMatrix:GetColVector(", a_nRow, ")") end

      if (type(a_nRow) ~= "number")         then error("Variable 'a_nRow' is not a number.",                          0) end
      if (a_nRow        < 1)                then error("Variable 'a_nRow' is less than one.",                         0) end
      if (a_nRow        > #self.m_tblIndex) then error("Variable 'a_nRow' exceeds the number of rows in the matrix.", 0) end

      local matRowVector = new_TNumberMatrix(1, #self.m_tblIndex[1])

      for nCol = 1, #self.m_tblIndex[1] do
        matRowVector:SetValue(1, nCol, self.m_tblPairs[self.m_tblIndex[a_nRow][nCol]].nValue)
      end

      if (g_bIsDebug) then PresentString("-TNumberMatrix:GetColVector(", a_nRow, ")") end
      return matRowVector
    end


  -- -------------------------------------------------------------------------
  -- Method SetRowVector
  --
  -- This method assigns the given row vector to the matrix indexed by the
  -- given row.
  -- -------------------------------------------------------------------------
    local function SetRowVector(self, a_nRow, a_matVector)
      if (g_bIsDebug) then PresentString("+TNumberMatrix:SetRowVector(", a_nRow, "a_matVector)") end

      if (type(a_nRow)               ~= "number")            then error("Variable 'a_nRow' is not a number.",                                            0) end
      if (type(a_matVector)          ~= "table")             then error("Variable 'a_matVector' is not a table.",                                        0) end
      if (type(a_matVector.GetType)  ~= "function")          then error("Variable 'a_matVector.GetType' is not a function.",                             0) end
      if (a_matVector:GetType()      ~= "TNumberMatrix")     then error("Variable 'a_matVector' is not of type TNumberMatrix.",                          0) end
      if (#a_matVector.m_tblIndex[1] ~= #self.m_tblIndex[1]) then error("Variable 'a_matVector' does not have the same number of columns as the matrix", 0) end

      for nCol = 1, #a_matVector.m_tblIndex[1] do
        if (type(a_matVector.m_tblPairs[a_matVector.m_tblIndex[1][nCol]].nValue) ~= "number") then error("Variable 'a_matVector' does not consist of all number elements.", 0) end
      end

      for nCol = 1, #a_matVector.m_tblIndex[1] do
        self.m_tblPairs[self.m_tblIndex[a_nRow][nCol]].nValue = a_matVector.m_tblPairs[a_matVector.m_tblIndex[1][nCol]].nValue
      end

      if (g_bIsDebug) then PresentString("-TNumberMatrix:SetRowVector(", a_nRow, "a_matVector)") end
    end


  -- -------------------------------------------------------------------------
  -- Method SetColVector
  --
  -- This method assigns the given column vector to the matrix indexed by the
  -- given column.
  -- -------------------------------------------------------------------------
    local function SetColVector(self, a_nCol, a_matVector)
      if (g_bIsDebug) then PresentString("+TNumberMatrix:SetColVector(", a_nCol, "a_matVector)") end

      if (type(a_nCol)              ~= "number")         then error("Variable 'a_nCol' is not a number.",                                          0) end
      if (type(a_matVector)         ~= "table")          then error("Variable 'a_matVector' is not a table.",                                      0) end
      if (type(a_matVector.GetType) ~= "function")       then error("Variable 'a_matVector.GetType' is not a function.",                           0) end
      if (a_matVector:GetType()     ~= "TNumberMatrix")  then error("Variable 'a_matVector' is not of type TNumberMatrix.",                        0) end
      if (#a_matVector.m_tblIndex   ~= #self.m_tblIndex) then error("Variable 'a_matVector' does not have the same number of rows as the matrix.", 0) end

      for nRow = 1, #a_matVector.m_tblIndex do
        if (type(a_matVector.m_tblPairs[a_matVector.m_tblIndex[nRow][1]].nValue) ~= "number") then error("Variable 'a_matVector' does not consist of all number elements.", 0) end
      end

      for nRow = 1, #a_matVector.m_tblIndex do
        self.m_tblPairs[self.m_tblIndex[nRow][a_nCol]].nValue = a_matVector.m_tblPairs[a_matVector.m_tblIndex[nRow][1]].nValue
      end

      if (g_bIsDebug) then PresentString("-TNumberMatrix:SetColVector(", a_nCol, "a_matVector)") end
    end

  -- -------------------------------------------------------------------------
  -- Method GetType
  --
  -- This method returns the type of this class.
  -- -------------------------------------------------------------------------
    local function GetType()
      return "TNumberMatrix"
    end


  -- -------------------------------------------------------------------------
  -- Method new_TNumberMatrix
  --
  -- This method creates an object of this class.
  -- -------------------------------------------------------------------------
    function new_TNumberMatrix(a_nRows, a_nCols)
      if (g_bIsDebug) then PresentString("+new_TNumberMatrix") end

      if (type(a_nRows) ~= "number") then error("Variable 'a_nRows' is not a number.", 0) end
      if (type(a_nCols) ~= "number") then error("Variable 'a_nCols' is not a number.", 0) end

      local obj =
      {
        GetType                   = GetType,
		GetDeterminantOf2x2Matrix = GetDeterminantOf2x2Matrix,
        GetColVector              = GetColVector,
        GetRowVector              = GetRowVector,
        SetColVector              = SetColVector,
        SetRowVector              = SetRowVector,
        SetValue                  = SetValue,
        SortPairs                 = SortPairs,
        m_tblPairs                = {},
        m_tblIndex                = {},
      }

      local nIndex  = 0

      for nRow = 1, a_nRows do
        local tblRow  = {}

        for nCol = 1, a_nCols do
          nIndex       = nIndex + 1
          tblRow[nCol] = nIndex
          table.insert(obj.m_tblPairs, { tblKey = { nI = nRow, nJ = nCol, }, nValue = 0.0, })
        end

        table.insert(obj.m_tblIndex, tblRow)
      end

      if (g_bIsDebug) then PresentString("-new_TNumberMatrix") end
      return obj
    end
  end


-- ---------------------------------------------------------------------------
-- Method new_TContainerFactory
--
-- This method creates an object of this class.
-- ---------------------------------------------------------------------------
  function new_TContainerFactory()
    if (g_bIsDebug) then PresentString("+new_TContainerFactory") end

    local obj =
    {
      new_TNumberMap      = new_TNumberMap,
      new_TNumberMultiMap = new_TNumberMultiMap,
      new_TNumberMatrix   = new_TNumberMatrix,
      new_TQueue          = new_TQueue,
      new_TStack          = new_TStack,
    }

    if (g_bIsDebug) then PresentString("-new_TContainerFactory") end
    return obj
  end
end

function AddNumbers(a_tblNumbers)
  local function SortAscendingByMagnitude(a_nNum1, a_nNum2)
    if (type(a_nNum1) ~= "number") then error("Variable 'a_nNum1' is not a number.", 0) end
    if (type(a_nNum2) ~= "number") then error("Variable 'a_nNum2' is not a number.", 0) end

    return math.abs(a_nNum1) < math.abs(a_nNum2)
  end

  if (g_bIsDebug) then PresentString("+AddNumbers") end

  if (type(a_tblNumbers) ~= "table") then error("Variable 'a_tblNumbers' is not a table.",   0) end
  if (#a_tblNumbers       < 2)       then error("Variable 'a_tblNumbers' is less than two.", 0) end

  for nI = 1, #a_tblNumbers do
    if (type(a_tblNumbers[nI]) ~= "number") then error("Variable 'a_tblNumbers' does not consist of all number elements.", 0) end
  end

  local nSum = 0

  do
    local tblNumbers = {}

    for nJ = 1, #a_tblNumbers do
      tblNumbers[nJ] = a_tblNumbers[nJ]
    end

    table.sort(tblNumbers, SortAscendingByMagnitude)

    for nK = 1, #tblNumbers do
      nSum = nSum + tblNumbers[nK]
    end
  end

  if (g_bIsDebug) then PresentString("-AddNumbers") end
  return nSum
end


-- ===========================================================================
-- Class TNumberMatrixAlgebra
--
-- This class encapsulates a algebra for a matrix of numbers.
-- ===========================================================================
do
-- ---------------------------------------------------------------------------
-- Method SwapRows
--
-- This method returns interchanges the indicies of two rows
-- ---------------------------------------------------------------------------
  local function SwapRows(a_matA, a_nRowI, anRowJ)
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:SwapRows(a_matA,", a_nRowI, a_nRowJ, ")") end

    if (type(a_matA)         ~= "table")            then error("Variable 'a_matA' is not a table.",                                 0) end
    if (type(a_matA.GetType) ~= "function")         then error("Variable 'a_matA.GetType' is not a function.",                      0) end
    if (a_matA.GetType()     ~= "TNumberMatrix")    then error("Variable 'a_matA' is not of type TNumberMatrix.",                   0) end
    if (#a_matA.m_tblIndex    < 1)                  then error("Variable 'a_matA' has less than one row.",                          0) end
    if (#a_matA.m_tblIndex[1] < 1)                  then error("Variable 'a_matA' has less than one column.",                       0) end
    if (type(a_nRowI)        ~= "number")           then error("Variable 'a_nRowI' is not a number.",                               0) end
    if (type(a_nRowJ)        ~= "number")           then error("Variable 'a_nRowJ' is not a number.",                               0) end
    if (a_nRowI               <  1)                 then error("Variable 'a_nRowI' is less than one.",                              0) end
    if (a_nRowI               > #a_matA.m_tblIndex) then error("Variable 'a_nRowI' exceeds the number of rows in matrix 'a_matA'.", 0) end
    if (a_nRowJ               <  1)                 then error("Variable 'a_nRowJ' is less than one.",                              0) end
    if (a_nRowJ               > #a_matA.m_tblIndex) then error("Variable 'a_nRowJ' exceeds the number of rows in matrix 'a_matA'.", 0) end

    local nTempIndex = 0

    if (a_nRowI ~= a_nRowJ) then
      for nCol = 1, #a_matA.m_tblIndex[1] do
        nTempIndex                       = a_matA.m_tblIndex[a_nRowI][nCol]
        a_matA.m_tblIndex[a_nRowI][nCol] = a_matA.m_tblIndex[a_nRowJ][nCol]
        a_matA.m_tblIndex[a_nRowJ][nCol] = nTempIndex
      end
    end

    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:SwapRows(a_matA,", a_nRowI, a_nRowJ, ")") end
    return a_matA
  end

-- ---------------------------------------------------------------------------
-- Method IsEqual
--
-- This method returns true when two matrices of the same dimension
-- have the same values or false otherwise.
-- ---------------------------------------------------------------------------
  local function IsEqual(a_matA, a_matB)
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:IsEqual(a_matA, a_matB)") end

    if (type(a_matA)          ~= "table")         then error("Variable 'a_matA' is not a table.",               0) end
    if (type(a_matA.GetType)  ~= "function")      then error("Variable 'a_matA.GetType' is not a function.",    0) end
    if (type(a_matB)          ~= "table")         then error("Variable 'a_matB' is not a table.",               0) end
    if (type(a_matB.GetType)  ~= "function")      then error("Variable 'a_matB.GetType' is not a function.",    0) end
    if (a_matA:GetType()      ~= "TNumberMatrix") then error("Variable 'a_matA' is not of type TNumberMatrix.", 0) end
    if (a_matB:GetType()      ~= "TNumberMatrix") then error("Variable 'a_matB' is not of type TNumberMatrix.", 0) end


    if (#a_matA.m_tblIndex    ~= #a_matB.m_tblIndex)    then return false end
    if (#a_matA.m_tblIndex[1] ~= #a_matB.m_tblIndex[1]) then return false end

    for nI = 1, #obj.m_tblPairs do
      if (a_matA.m_tblPairs[nI].nValue ~= a_matB.m_tblPairs[nI].nValue) then return false end
    end


    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:IsEqual(a_matA, a_matB)") end
    return true
  end


-- ---------------------------------------------------------------------------
-- Method Add
--
-- This method adds two matrices of the same dimension and returns the result.
-- ---------------------------------------------------------------------------
  local function Add(a_matA, a_matB)
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:Add(a_matA, a_matB)") end

    if (type(a_matA)          ~= "table")               then error("Variable 'a_matA' is not a table.",                                            0) end
    if (type(a_matA.GetType)  ~= "function")            then error("variable 'a_matA.GetType' is not a function.",                                 0) end
    if (type(a_matB)          ~= "table")               then error("Variable 'a_matB' is not a table.",                                            0) end
    if (type(a_matB.GetType)  ~= "function")            then error("Variable 'a_matB.GetType' is not a function.",                                 0) end
    if (a_matA:GetType()      ~= "TNumberMatrix")       then error("Variable 'a_matA' is not of type TNumberMatrix.",                              0) end
    if (a_matB:GetType()      ~= "TNumberMatrix")       then error("Variable 'a_matB' is not of type TNumberMatrix.",                              0) end
    if (#a_matA.m_tblIndex    ~= #a_matB.m_tblIndex)    then error("Matrix 'a_matA' does not have the same number of rows as matrix 'a_matB'.",    0) end
    if (#a_matA.m_tblIndex[1] ~= #a_matB.m_tblIndex[1]) then error("Matrix 'a_matA' does not have the same number of columns as matrix 'a_matB'.", 0) end

    local obj = new_TNumberMatrix(#a_matA.m_tblIndex, #a_matA.m_tblIndex[1])

    for nI = 1, #obj.m_tblPairs do
     obj.m_tblPairs[nI].nValue = a_matA.m_tblPairs[nI].nValue + a_matB.m_tblPairs[nI].nValue
    end

    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:Add(a_matA, a_matB)") end
    return obj
  end

-- ---------------------------------------------------------------------------
-- Method AddNumberMatrices
--
-- This method adds matrices of the same dimension and returns the result.
-- ---------------------------------------------------------------------------
  local function AddNumberMatrices(a_tblMatrices)
    local function SortAscendingByMagnitude(a_matA, a_matB)
      if (type(a_matA)          ~= "table")               then error("Variable 'a_matA' is not a table.",                                            0) end
      if (type(a_matA.GetType)  ~= "function")            then error("Variable 'a_matA.GetType' is not a function.",                                 0) end
      if (type(a_matB)          ~= "table")               then error("Variable 'a_matB' is not a table.",                                            0) end
      if (type(a_matB.GetType)  ~= "function")            then error("Variable 'a_matB.GetType' is not a function.",                                 0) end
      if (a_matA:GetType()      ~= "TNumberMatrix")       then error("Variable 'a_matA' is not of type TNumberMatrix.",                              0) end
      if (a_matB:GetType()      ~= "TNumberMatrix")       then error("Variable 'a_matB' is not of type TNumberMatrix.",                              0) end
      if (#a_matA.m_tblIndex    ~= #a_matB.m_tblIndex)    then error("Matrix 'a_matA' does not have the same number of rows as matrix 'a_matB'.",    0) end
      if (#a_matA.m_tblIndex[1] ~= #a_matB.m_tblIndex[1]) then error("Matrix 'a_matA' does not have the same number of columns as matrix 'a_matB'.", 0) end

      local nMagA = math.abs(a_matA.m_tblPairs[1].nValue)
      local nMagB = math.abs(a_matB.m_tblPairs[1].nValue)
      local nMagX = 0

      for   nI = 1, #a_matA.m_tblIndex do
        for nJ = 1, #a_matA.m_tblIndex[1] do
          nMagX = math.abs(a_matA.m_tblPairs[a_matA.m_tblIndex[nI][nJ]].nValue)

          if (nMagA < nMagX) then
            nMagA = nMagX
          end

          nMagX = math.abs(a_matB.m_tblPairs[a_matB.m_tblIndex[nI][nJ]].nValue)

          if (nMagB < nMagX) then
            nMagB = nMagX
          end
        end
      end

      return nMagA < nMagB
    end

    if (type(a_tblMatrices) ~= "table") then error("Variable 'a_tblMatrices' is not a table.",                  0) end
    if (#a_tblMatrices       < 2)       then error("Variable 'a_tblMatrices' contains less than two matrices.", 0) end

    for nI = 1, #a_tblMatrices do
      if (type(a_tblMatrices[nI])          ~= "table")                         then error("Variable 'a_tblMatrices[nI]' is not a table.",                                                      0) end
      if (type(a_tblMatrices[nI].GetType)  ~= "function")                      then error("Variable 'a_tblMatrices[nI].GetType' is not a function.",                                           0) end
      if (a_tblMatrices[nI]:GetType()      ~= "TNumberMatrix")                 then error("Variable 'a_tblMatrices[nI]' is not of type TNumberMatrix.",                                        0) end
      if (#a_tblMatrices[nI].m_tblIndex    ~= #a_tblMatrices[1].m_tblIndex)    then error("Matrix 'a_tblMatrices[nI]' does not have the same number of rows as matrix 'a_tblMatrices[1]'.",    0) end
      if (#a_tblMatrices[nI].m_tblIndex[1] ~= #a_tblMatrices[1].m_tblIndex[1]) then error("Matrix 'a_tblMatrices[nI]' does not have the same number of columns as matrix 'a_tblMatrices[1]'.", 0) end
    end

    local matSum = {}

    table.insert(matSum, new_TNumberMatrix(#a_tblMatrices[1].m_tblIndex, #a_tblMatrices[1], m_tblIndex[1]))

    for nJ = 1, #a_tblMatrices do
      matSum[1] = Add(matSum[1], a_tblMatrices[nJ])
    end


--  Check the commutative property of addition for matrices.

    table.insert(matSum, new_TNumberMatrix(#a_tblMatrices[1].m_tblIndex, #a_tblMatrices[1], m_tblIndex[1]))

    for nJ = #a_tblMatrices, 1, -1 do
      matSum[2] = Add(matSum[2], a_tblMatrices[nJ])
    end

    if IsEqual(matSum[1], matSum[2]) then
      table.remove(matSum)
    else
      PresentString ("(E) The commutative property of addition does not hold for these matrices due to precision loss in the order of addition of the elements!")
      error()
    end

    return matSum[1]
  end

-- ---------------------------------------------------------------------------
-- Method Negative
--
-- This method returns the negative of a given number matrix.
-- ---------------------------------------------------------------------------
  local function Negative(a_matA)
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:Negative(a_matA)") end

    if (type(a_matA)          ~= "table")         then error("Variable 'a_matA' is not a table.",               0) end
    if (type(a_matA.GetType)  ~= "function")      then error("Variable 'a_matA.GetType' is not a function.",    0) end
    if (a_matA:GetType()      ~= "TNumberMatrix") then error("Variable 'a_matA' is not of type TNumberMatrix.", 0) end
    if (#a_matA.m_tblIndex    > 0)                then error() end
    if (#a_matA.m_tblIndex[1] > 0)                then error() end

    local obj = new_TNumberMatrix(#a_matA.m_tblIndex, #a_matA.m_tblIndex[1])

    for nI = 1, #obj.m_tblPairs do
     obj.m_tblPairs[nI].nValue = -1.0 * a_matA.m_tblPairs[nI].nValue
    end

    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:Negative(a_matA)") end
    return obj
  end


-- ---------------------------------------------------------------------------
-- Method ScalarProduct
--
-- This method returns the product of a given scalar with a given number
-- matrix.
-- ---------------------------------------------------------------------------
  local function ScalarProduct(a_nScalar, a_matA)
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:ScalarProduct(a_matA)") end

    if (type(a_nScalar)       ~= "number")        then error("Variable 'a_nScalar' is not a number.",           0) end
    if (type(a_matA)          ~= "table")         then error("Variable 'a_matA' is not a table.",               0) end
    if (type(a_matA.GetType)  ~= "function")      then error("Variable 'a_matA.GetType' is not a function.",    0) end
    if (a_matA:GetType()      ~= "TNumberMatrix") then error("Variable 'a_matA' is not of type TNumberMatrix.", 0) end
    if (#a_matA.m_tblIndex    > 0)                then error() end
    if (#a_matA.m_tblIndex[1] > 0)                then error() end

    local obj = new_TNumberMatrix(#a_matA.m_tblIndex, #a_matA.m_tblIndex[1])

    for nI = 1, #obj.m_tblPairs do
     obj.m_tblPairs[nI].nValue = a_nScalar * a_matA.m_tblPairs[nI].nValue
    end

    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:ScalarProduct(a_matA)") end
    return obj
  end

-- ---------------------------------------------------------------------------
-- Method AddMultipleOfOneRowToAnother
--
-- This method adds a multiple of one row to another row.
-- ---------------------------------------------------------------------------
  local function AddMultipleOfOneRowToAnother(a_matA, a_nMultiple, a_nRowI, a_nRowJ)
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:AddMultipleOfOneRowToAnother(a_matA,", a_nMultiple, a_nRowI, a_nRowJ")") end

    if (type(a_matA)         ~= "table")            then error() end
    if (type(a_matA.GetType) ~= "function")         then error() end
    if (a_matA.GetType()     ~= "TNumberMatrix")    then error() end
    if (#a_matA.m_tblIndex    < 1)                  then error() end
    if (#a_matA.m_tblIndex[1] < 1)                  then error() end
    if (type(a_nMultiple)    ~= "number")           then error() end
    if (type(a_nRowI)        ~= "number")           then error() end
    if (type(a_nRowJ)        ~= "number")           then error() end
    if (a_nRowI               <  1)                 then error() end
    if (a_nRowI               > #a_matA.m_tblIndex) then error() end
    if (a_nRowJ               <  1)                 then error() end
    if (a_nRowJ               > #a_matA.m_tblIndex) then error() end
    if (a_nRowI              == a_nRowJ)            then error() end

    local tblRowVectors = {}

    table.insert(tblRowVectors, a_matA:GetRowVector(a_nRowI))
    table.insert(tblRowVectors, a_matA:GetRowVector(a_nRowJ))
    a_matA:SetRowVector(a_nRowJ, Add(ScalarProduct(a_nMultiple, tblRowVectors[1]), tblRowVectors[2]))
    table.remove(tblRowVectors)
    table.remove(tblRowVectors)

    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:AddMultipleOfOneRowToAnother(a_matA,", a_nMultiple, a_nRowI, a_nRowJ")") end
    return a_matA
  end

-- ---------------------------------------------------------------------------
-- Method Multiply
--
-- This method returns the matrix product.
-- ---------------------------------------------------------------------------
  local function Multiply(a_matA, a_matB)
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:Multiply(a_matA, a_matB)") end

    if (type(a_matA)          ~= "table")            then error() end
    if (type(a_matA.GetType)  ~= "function")         then error() end
    if (type(a_matB)          ~= "table")            then error() end
    if (type(a_matB.GetType)  ~= "function")         then error() end
    if (a_matA:GetType()      ~= "TNumberMatrix")    then error() end
    if (a_matB:GetType()      ~= "TNumberMatrix")    then error() end
    if (#a_matA.m_tblIndex[1] ~= #a_matB.m_tblIndex) then error() end

    local cf                 = new_TContainerFactory()
    local stackOuterProducts = cf.new_TStack()

    for nI = 1, #a_matA.m_tblIndex[1] do
      local matColVector    = a_matA.GetColVector(nI)
      local matRowVector    = a_matB.GetRowVector(nI)
      local matOuterProduct = cf.new_TNumberMatrix(#a_matA.m_tblIndex, #a_matB.m_tblIndex[1])

      for   nRow = 1, #matColVector.m_tblIndex    do
        for nCol = 1, #matRowVector.m_tblIndex[1] do
          matRowVector = ScalarProduct(matColVector.m_tblPairs[matColVector.m_tblIndex[nRow][1]].nValue, matRowVector)
        end

        matOuterProduct:SetRowVector(nRow, matRowVector)
      end

      stackOuterProducts:Push(matOuterProduct)
    end

    local matSumOfOuterProducts = AddNumberMatrices(stackOuterProducts.m_vecItems)

    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:Multiply(a_matA, a_matB)") end
    return matSumOfOuterProducts
  end

-- ---------------------------------------------------------------------------
-- Method AugmentedMatrix
--
-- This method returns the augmented matrix given a coefficient matrix and a
-- solution matrix.
-- ---------------------------------------------------------------------------
  local function AugmentedMatrix(a_matA, a_matB)
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:AugmentedMatrix(a_matA, a_matB)") end

    if (type(a_matA)          ~= "table")            then error() end
    if (type(a_matA.GetType)  ~= "function")         then error() end
    if (a_matA:GetType()      ~= "TNumberMatrix")    then error() end
    if (#a_matA.m_tblPairs     < 1)                  then error() end
    if (type(a_matB)          ~= "table")            then error() end
    if (type(a_matB.GetType)  ~= "function")         then error() end
    if (a_matB:GetType()      ~= "TNumberMatrix")    then error() end
    if (#a_matB.m_tblPairs     < 1)                  then error() end
    if (#a_matA.m_tblIndex    ~= #a_matB.m_tblIndex) then error() end
    if (#a_matA.m_tblIndex[1]  < 1)                  then error() end
    if (#a_matB.m_tblIndex[1] ~= 1)                  then error() end

    local nRows = #a_matA.m_tblIndex
    local nCols = #a_matA.m_tblIndex[1] + 1
    local cf    = new_TContainerFactory()
    local obj   = cf.new_TNumberMatrix(nRows, nCols)

    for   nI = 1, #a_matA.m_tblIndex    do
      for nJ = 1, #a_matA.m_tblIndex[1] do
        obj.m_tblPairs[obj.m_tblIndex[nI][nJ]].nValue = a_matA.m_tblPairs[a_matA.m_tblIndex[nI][nJ]].nValue
      end

      obj.m_tblPairs[obj.m_tblIndex[nI][nCols]].nValue = a_matB.m_tblPairs[a_matB.m_tblIndex[nI][1]].nValue
    end

    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:AugmentedMatrix(a_matA, a_matB)") end
    return obj
  end

-- ---------------------------------------------------------------------------
-- Method Solve__AX_Equals_B_For_X
--
-- This method reduces the given augmented matrix into row echelon form.
-- ---------------------------------------------------------------------------
  local function Solve__AX_Equals_B_For_X(a_matA, a_matB)
  -- -------------------------------------------------------------------------
  -- Perform Gaussian Elimination with Scaled Partial Pivoting to reduce
  --   matrix A to row echelon form.
  --
  -- Perform Backsubstitution to solve AX = B for X.
  -- -------------------------------------------------------------------------
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:Solve__AX_Equals_B_For_X(a_matA)") end

    if (type(a_matA)          ~= "table")               then error("Variable 'a_matA' is not a table.",                                         0) end
    if (type(a_matA.GetType)  ~= "function")            then error("Variable 'a_matA.GetType' is not a function.",                              0) end
    if (a_matA.GetType()      ~= "TNumberMatrix")       then error("Variable 'a_matA' is not of type 'TNumberMatrix'.",                         0) end
    if (#a_matA.m_tblIndex     < 1)                     then error("Matrix 'a_matA' does not have any rows.",                                   0) end
    if (#a_matA.m_tblIndex[1]  < 1)                     then error("Matrix 'a_matA' does not have any columns.",                                0) end
    if ((#a_matA.m_tblIndex)  ~= #a_matA.m_tblIndex[1]) then error("Matrix 'a_matA' is not a square matrix.",                                   0) end
    if (type(a_matB)          ~= "table")               then error("Variable 'a_matB' is not a table.",                                         0) end
    if (type(a_matB.GetType)  ~= "function")            then error("Variable 'a_matB.GetType' is not a function.",                              0) end
    if (a_matB:GetType()      ~= "TNumberMatrix")       then error("Variable 'a_matB' is not of type 'TNumberMatrix'.",                         0) end
    if (#a_matB.m_tblIndex    ~= #a_matA.m_tblIndex)    then error("Matrix 'a_matB' does not have the same number of rows as matrix 'a_matA'.", 0) end
    if (#a_matB.m_tblIndex[1] ~= 1)                     then error("Matrix 'a_matB' does not have exactly 1 column.",                           0) end


  -- Perform Gaussian Elimination with Scaled Partial Pivoting to reduce
  --   matrix A to row echelon form.

    local nMaximumMagnitude = 0
    local nTempMagnitude    = 0
    local tblScaleVector    = {}
    local tblRowIndexVector = {}

    for nRow = 1, #a_matA.m_tblIndex do
      table.insert(tblRowIndexVector, nRow)
      nMaximumMagnitude = 0
      nTempMagnitude    = 0

      for nCol = 1, #a_matA.m_tblIndex[1] do
        nTempMagnitude = math.abs(a_matA.m_tblPairs[a_matA.m_tblIndex[nRow][nCol]].nValue)

        if (nTempMagnitude > nMaximumMagnitude) then
          nMaximumMagnitude = nTempMagnitude
        end
      end

      table.insert(tblScaleVector, nMaximumMagnitude)
    end


    local nMaximumRatio  = 0
    local nTempRatio     = 0
    local tblRatioVector = {}
    local nN             = #a_matA.m_tblIndex
    local nJ             = 0
    local nLK            = 0
    local nScalar        = 0

    for nK = 1, nN - 1 do
      nMaximumRatio = 0

      for nI = nK, nN do
        nTempRatio = math.abs(a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nK]].nValue / tblScaleVector[tblRowIndexVector[nI]])

        if (nTempRatio > nMaximumRatio) then
          nMaximumRatio = nTempRatio
          nJ            = nI
        end
      end

      nLK                   = tblRowIndexVector[nJ]
      tblRowIndexVector[nJ] = tblRowIndexVector[nK]
      tblRowIndexVector[nK] = nLK

      for nI = nK+1, nN do
        nScalar = a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nK]].nValue / a_matA.m_tblPairs[a_matA.m_tblIndex[nLK][nK]].nValue

        for nJ = nK+1, nN do
          a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nJ]].nValue = a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nJ]].nValue - nScalar * a_matA.m_tblPairs[a_matA.m_tblIndex[nLK][nJ]].nValue
        end

        a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nK]].nValue = nScalar
      end
    end


  -- Perform Backsubstitution to solve AX = B for X.

    local cf   = new_TContainerFactory()
    local matX = cf.new_TNumberMatrix(#a_matA.m_tblIndex, 1)

    for   nK = 1,      nN - 1 do
      for nI = nK + 1, nN     do
        a_matB.m_tblPairs[a_matB.m_tblIndex[tblRowIndexVector[nI]][1]].nValue = a_matB.m_tblPairs[a_matB.m_tblIndex[tblRowIndexVector[nI]][1]].nValue - a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nK]].nValue * a_matB.m_tblPairs[a_matB.m_tblIndex[tblRowIndexVector[nK]][1]].nValue
      end
    end

    matX.m_tblPairs[matX.m_tblIndex[nN][1]].nValue = a_matB.m_tblPairs[a_matB.m_tblIndex[tblRowIndexVector[nN]][1]].nValue / a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nN]][nN]].nValue

    local nSum

    for nI = nN - 1, 1, -1 do
      nSum = a_matB.m_tblPairs[a_matB.m_tblIndex[tblRowIndexVector[nI]][1]].nValue

      for nJ = nI + 1, nN do
        nSum = nSum - a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nJ]].nValue * matX.m_tblPairs[matX.m_tblIndex[nJ][1]].nValue
      end

      matX.m_tblPairs[matX.m_tblIndex[nI][1]].nValue = nSum / a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nI]].nValue
    end

    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:Solve__AX_Equals_B_For_X(a_matA, a_matB)") end
    return matX
  end


-- ---------------------------------------------------------------------------
-- Method Determinant
--
-- This method returns the determinant of a square matrix by row reduction.
-- ---------------------------------------------------------------------------
  local function Determinant(a_matA)
  -- -------------------------------------------------------------------------
  -- Perform Gaussian Elimination with Scaled Partial Pivoting to reduce
  --   matrix A to row echelon form.
  --
  -- Calculate the determinant.
  -- -------------------------------------------------------------------------
    if (g_bIsDebug) then PresentString("+TNumberMatrixAlgebra:Determinant(a_matA)") end

    if (type(a_matA)          ~= "table")               then error("Variable 'a_matA' is not a table.",                                         0) end
    if (type(a_matA.GetType)  ~= "function")            then error("Variable 'a_matA.GetType' is not a function.",                              0) end
    if (a_matA.GetType()      ~= "TNumberMatrix")       then error("Variable 'a_matA' is not of type 'TNumberMatrix'.",                         0) end
    if (#a_matA.m_tblIndex     < 1)                     then error("Matrix 'a_matA' does not have any rows.",                                   0) end
    if (#a_matA.m_tblIndex[1]  < 1)                     then error("Matrix 'a_matA' does not have any columns.",                                0) end
    if ((#a_matA.m_tblIndex)  ~= #a_matA.m_tblIndex[1]) then error("Matrix 'a_matA' is not a square matrix.",                                   0) end

	local numDeterminant = 1

  -- Perform Gaussian Elimination with Scaled Partial Pivoting to reduce
  --   matrix A to row echelon form.

    local nMaximumMagnitude = 0
    local nTempMagnitude    = 0
    local tblScaleVector    = {}
    local tblRowIndexVector = {}

    for nRow = 1, #a_matA.m_tblIndex do
      table.insert(tblRowIndexVector, nRow)
      nMaximumMagnitude = 0
      nTempMagnitude    = 0

      for nCol = 1, #a_matA.m_tblIndex[1] do
        nTempMagnitude = math.abs(a_matA.m_tblPairs[a_matA.m_tblIndex[nRow][nCol]].nValue)

        if (nTempMagnitude > nMaximumMagnitude) then
          nMaximumMagnitude = nTempMagnitude
        end
      end

      table.insert(tblScaleVector, nMaximumMagnitude)
    end


    local nMaximumRatio  = 0
    local nTempRatio     = 0
    local tblRatioVector = {}
    local nN             = #a_matA.m_tblIndex
    local nJ             = 0
    local nLK            = 0
    local nScalar        = 0

    for nK = 1, nN - 1 do
      nMaximumRatio = 0

      for nI = nK, nN do
        nTempRatio = math.abs(a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nK]].nValue / tblScaleVector[tblRowIndexVector[nI]])

        if (nTempRatio > nMaximumRatio) then
          nMaximumRatio = nTempRatio
          nJ            = nI
        end
      end

      nLK                   = tblRowIndexVector[nJ]
      tblRowIndexVector[nJ] = tblRowIndexVector[nK]
      tblRowIndexVector[nK] = nLK

      for nI = nK+1, nN do
        nScalar = a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nK]].nValue / a_matA.m_tblPairs[a_matA.m_tblIndex[nLK][nK]].nValue

        for nJ = nK+1, nN do
          a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nJ]].nValue = a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nJ]].nValue - nScalar * a_matA.m_tblPairs[a_matA.m_tblIndex[nLK][nJ]].nValue
        end

        a_matA.m_tblPairs[a_matA.m_tblIndex[tblRowIndexVector[nI]][nK]].nValue = nScalar
      end
    end


  -- TBD: Calculate the determinant


    if (g_bIsDebug) then PresentString("-TNumberMatrixAlgebra:Determinant(a_matA)") end
    return 0
  end


-- ---------------------------------------------------------------------------
-- Method GetType
--
-- This method returns the type of this class.
-- ---------------------------------------------------------------------------
  local function GetType()
    return "TNumberMatrixAlgebra"
  end


-- ---------------------------------------------------------------------------
-- Method new_TNumberMatrixAlgebra
--
-- This method creates an object of this class.
-- ---------------------------------------------------------------------------
  function new_TNumberMatrixAlgebra()
    if (g_bIsDebug) then PresentString("+new_TNumberMatrixAlgebra") end

    local obj =
    {
      GetType           = GetType,
      IsEqual           = IsEqual,
      Add               = Add,
      Negative          = Negative,
      ScalarProduct     = ScalarProduct,
      Multiply          = Multiply,
      Solve             = Solve__AX_Equals_B_For_X,
    }

    if (g_bIsDebug) then PresentString("-new_TNumberMatrixAlgebra") end
    return obj
  end
end


-- ===========================================================================
-- Class TDescriptiveStatistics
--
-- This class encapsulates the mathematical concept of a function.
-- ===========================================================================
do
-- ---------------------------------------------------------------------------
-- Method Mean
--
-- This method returns the sample mean.
-- ---------------------------------------------------------------------------
  local function Mean(a_tblNumbers)
    if (g_bIsDebug) then PresentString("+new_TMean(a_tblNumbers)") end

    if (type(a_tblNumbers) ~= "table") then error("Variable 'a_tblNumbers' is not a table.", 0) end
    if (#a_tblNumbers       < 1)       then error("Table 'a_tblNumbers' is empty.",          0) end

    for nI = 1, #a_tblNumbers do
      if (type(a_tblNumbers[nI]) ~= "number") then error("Table 'a_tblNumbers' is not composed of all numbers.", 0) end
    end


    local nMean = 0

    if (#a_tblNumbers == 1) then
      nMean = a_tblNumbers[1]
    else
      nMean = AddNumbers(a_tblNumbers) / #a_tblNumbers
    end


    if (g_bIsDebug) then PresentString("-new_TMean(a_tblNumbers)") end
    return nMean
  end

-- ---------------------------------------------------------------------------
-- Method GetType
--
-- This method returns the type of this class.
-- ---------------------------------------------------------------------------
  local function GetType()
    return "TDescriptiveStatistics"
  end


-- ---------------------------------------------------------------------------
-- Method new_TDescriptiveStatistics
--
-- This method creates an object of this class.
-- ---------------------------------------------------------------------------
  function new_TDescriptiveStatistics()
    if (g_bIsDebug) then PresentString("+new_TDescriptiveStatistics") end

    local obj =
    {
      GetType = GetType,
      AVERAGE = Mean,
    }

    if (g_bIsDebug) then PresentString("-new_TDescriptiveStatistics") end
    return obj
  end
end

-- ===========================================================================
-- Class TMultipleLinearRegressionEstimator
--
-- This class estimates a linear function from a table of multiple inputs/
-- output pairs.
-- ===========================================================================
do
-- ---------------------------------------------------------------------------
-- Method Initialize
--
-- This method computes the coefficients of the interpolating polynomial.
-- ---------------------------------------------------------------------------
  local function Initialize(self, a_tblNumberMatrix)
-- ---------------------------------------------------------------------------
-- Initialize variables.
-- Solve AX = B for X where X is the column vector of coefficients.
-- ---------------------------------------------------------------------------
    if (g_bIsDebug) then PresentString("+TMultipleLinearRegressionEstimator:Initialize") end

    if (type(a_tblNumberMatrix)         ~= "table")         then error("Variable 'a_tblNumberMatrix' is not a table.",                 0) end
    if (type(a_tblNumberMatrix.GetType) ~= "function")      then error("Variable 'a_tblNumberMatrix.GetType' is not a function.",      0) end
    if (a_tblNumberMatrix.GetType()     ~= "TNumberMatrix") then error("Variable 'a_tblNumberMatrix' is not of type 'TNumberMatrix'.", 0) end
    if (#a_tblNumberMatrix.m_tblIndex    < 2              ) then error("Variable 'a_tblNumberMatrix' has less than two rows.",         0) end
    if (#a_tblNumberMatrix.m_tblIndex[1] < 3              ) then error("Variable 'a_tblNumberMatrix' has less than three columns.",    0) end


  -- Initialize variables.

    local nCols    = 0
    local nSize    = #a_tblNumberMatrix.m_tblIndex[1] - 1
    local nRows    = #a_tblNumberMatrix.m_tblIndex

    for nCol = #a_tblNumberMatrix.m_tblIndex[1], 1, -1 do
      nCols = nCols + nCol
    end

    local matProducts         = new_TNumberMatrix(nRows, nCols)
    local matSubtotals        = new_TNumberMatrix(    1, #a_tblNumberMatrix.m_tblIndex[1])
    local matMeans            = new_TNumberMatrix(    1, #a_tblNumberMatrix.m_tblIndex[1])
    local matProductSubtotals = new_TNumberMatrix(    1, nCols)
    local matS                = new_TNumberMatrix(nSize, #a_tblNumberMatrix.m_tblIndex[1])
    local matA                = new_TNumberMatrix(nSize, nSize)
    local matB                = new_TNumberMatrix(nSize, 1)
    local matAlgebra          = new_TNumberMatrixAlgebra()

    local nStart    = 0
    local nProduct  = 0
    local nColCount = 0

    for nRow = 1, #a_tblNumberMatrix.m_tblIndex do
      nColCount = 0

      for   nStart =      1, #a_tblNumberMatrix.m_tblIndex[1] do
        for nCol   = nStart, #a_tblNumberMatrix.m_tblIndex[1] do
          nColCount = nColCount + 1
          nProduct = a_tblNumberMatrix.m_tblPairs[a_tblNumberMatrix.m_tblIndex[nRow][nStart]].nValue * a_tblNumberMatrix.m_tblPairs[a_tblNumberMatrix.m_tblIndex[nRow][nCol]].nValue
          matProducts:SetValue(nRow, nColCount, nProduct)
        end
      end
    end

    for nCol = 1, #a_tblNumberMatrix.m_tblIndex[1] do
      local nSubTotal    = 0
      local nMean        = 0
      local stackNumbers = new_TStack()

      for nRow = 1, #a_tblNumberMatrix.m_tblIndex do
        stackNumbers.Push(stackNumbers.m_vecItems, a_tblNumberMatrix.m_tblPairs[a_tblNumberMatrix.m_tblIndex[nRow][nCol]].nValue)
      end

      nSubTotal = AddNumbers(stackNumbers.m_vecItems)
      nMean     = nSubTotal / #a_tblNumberMatrix.m_tblIndex
      matSubtotals:SetValue(1, nCol, nSubTotal)
      matMeans:SetValue(1, nCol, nMean)
    end

    nColCount = 0

    for nStart = 1, #a_tblNumberMatrix.m_tblIndex[1] do

      for nCol = nStart, #a_tblNumberMatrix.m_tblIndex[1] do
        local nProductSubTotal = 0
        local stackProducts    = new_TStack()

        nColCount = nColCount + 1
        nProduct  = 0

        for nRow = 1, #a_tblNumberMatrix.m_tblIndex do
          nProduct = matProducts.m_tblPairs[matProducts.m_tblIndex[nRow][nColCount]].nValue
          stackProducts.Push(stackProducts.m_vecItems, nProduct)
        end

        nProductSubTotal = AddNumbers(stackProducts.m_vecItems)
        matProductSubtotals:SetValue(1, nColCount, nProductSubTotal)
      end
    end

    for nRow = 1, #a_tblNumberMatrix.m_tblIndex[1]-1 do
      for nCol = 1, #a_tblNumberMatrix.m_tblIndex[1] do
        local nValue = 0

        nValue = -1 * nRows * matMeans.m_tblPairs[matMeans.m_tblIndex[1][nRow]].nValue * matMeans.m_tblPairs[matMeans.m_tblIndex[1][nCol]].nValue
        matS:SetValue(nRow, nCol, nValue)
      end
    end

    nColCount = 0

    for   nRow = 1,      #a_tblNumberMatrix.m_tblIndex[1]-1 do
      for nCol = 1, nRow-1 do
        local nValue = 0

        nValue = matS.m_tblPairs[matS.m_tblIndex[nCol][nRow]].nValue
        matS:SetValue(nRow, nCol, nValue)
      end

      for nCol = nRow, #a_tblNumberMatrix.m_tblIndex[1]   do
        nColCount = nColCount + 1
        local nValue = 0

        nValue = matProductSubtotals.m_tblPairs[matProductSubtotals.m_tblIndex[1][nColCount]].nValue - nRows * matMeans.m_tblPairs[matMeans.m_tblIndex[1][nRow]].nValue * matMeans.m_tblPairs[matMeans.m_tblIndex[1][nCol]].nValue
        matS:SetValue(nRow, nCol, nValue)
      end
    end

    for   nRow = 1, #a_tblNumberMatrix.m_tblIndex[1]-1 do
      for nCol = 1, #a_tblNumberMatrix.m_tblIndex[1]-1 do
        local nValue = 0

        nValue = matS.m_tblPairs[matS.m_tblIndex[nRow][nCol]].nValue
        matA:SetValue(nRow, nCol, nValue)
      end
    end

    for nRow = 1, #a_tblNumberMatrix.m_tblIndex[1]-1 do
      local nCol   = 1
      local nValue = 0

      nValue = matS.m_tblPairs[matS.m_tblIndex[nRow][#a_tblNumberMatrix.m_tblIndex[1]]].nValue
      matB:SetValue(nRow, 1, nValue)
    end


-- Solve AX = B for X where X is the column vector of coefficients.

    matX = matAlgebra.Solve(matA, matB)

    self.m_nAlpha = 0

    for nCol = 1, nSize do
      self.m_vecCoeff[nCol] = matX.m_tblPairs[matX.m_tblIndex[nCol][1]].nValue
      self.m_nAlpha         = self.m_vecCoeff[nCol] * matMeans.m_tblPairs[matMeans.m_tblIndex[1][nCol]].nValue + self.m_nAlpha
    end

    self.m_nAlpha = matMeans.m_tblPairs[matMeans.m_tblIndex[1][#a_tblNumberMatrix.m_tblIndex[1]]].nValue - self.m_nAlpha

    if (g_bIsDebug) then PresentString("-TMultipleLinearRegressionEstimator:Initialize") end
  end

-- ---------------------------------------------------------------------------
-- Method Estimate
--
-- This method estimates the output of an unknown function with a given
-- table of inputs (a_tblInputs).
-- ---------------------------------------------------------------------------
  local function Estimate(self, a_tblInputs)
    if (g_bIsDebug) then PresentString("+TMultipleRegressionEstimator:Estimate") end

    if (type(a_tblInputs) ~= "table")          then error ("Variable 'a_tblInputs' is not a table.",          0) end
    if (#a_tblInputs      ~= #self.m_vecCoeff) then error ("Variable 'a_tblInputs' is not the correct size.", 0) end

    for nJ = 1, #a_tblInputs do
      if (type(a_tblInputs[nJ]) ~= "number") then error ("Variable 'a_tblInputs' does not consist of all numbers.", 0) end
    end

    local nY    = 0
    local nTemp = self.m_nAlpha

    for nI = 1, #self.m_vecCoeff do
      nTemp = self.m_vecCoeff[nI] * a_tblInputs[nI] + nTemp
    end

    nY = nTemp

    if (g_bIsDebug) then PresentString("-TMultipleRegressionEstimator:Estimate") end

    return nY
  end


-- ---------------------------------------------------------------------------
-- Method GetType
--
-- This method returns the type of this class.
-- ---------------------------------------------------------------------------
  local function GetType()
    return "TMultipleLinearRegressionEstimator"
  end

-- ---------------------------------------------------------------------------
-- Method new_TMultipleLinearRegressionEstimator
--
-- This method creates an object of this class.
-- ---------------------------------------------------------------------------
  function new_TMultipleLinearRegressionEstimator(a_tblNumberMatrix)
    if (g_bIsDebug) then PresentString("+new_TMultipleLinearRegressionEstimator") end

    if (type(a_tblNumberMatrix)         ~= "table")         then error("Variable 'a_tblNumberMatrix' is not a table.",                 0) end
    if (type(a_tblNumberMatrix.GetType) ~= "function")      then error("Method 'a_tblNumberMatrix.GetType' is not a function.",        0) end
    if (a_tblNumberMatrix.GetType()     ~= "TNumberMatrix") then error("Variable 'a_tblNumberMatrix' is not of type 'TNumberMatrix'.", 0) end

    local obj =
    {
      GetType     = GetType,
      Estimate    = Estimate,
      m_fcn       = a_tblNumberFunction,
      m_vecCoeff  = {},
      m_nAlpha    = 0,
    }

    Initialize(obj, a_tblNumberMatrix)

    if (g_bIsDebug) then PresentString("-new_TMultipleLinearRegressionEstimator") end
    return obj
  end

end


-- ===========================================================================
-- Class TNumberFunction
--
-- This class encapsulates the mathematical concept of a function.
-- ===========================================================================
do
-- ---------------------------------------------------------------------------
-- Method GetType
--
-- This method returns the type of this class.
-- ---------------------------------------------------------------------------
  local function GetType()
    return "TNumberFunction"
  end


-- ---------------------------------------------------------------------------
-- Method new_TNumberFunction
--
-- This method creates an object of this class given a number multi-map.
-- Note: the last duplicated key value is preserved.
-- ---------------------------------------------------------------------------
  function new_TNumberFunction(a_tblNumberMultiMap)
    if (g_bIsDebug) then PresentString("+new_TNumberFunction") end

    if (type(a_tblNumberMultiMap)            ~= "table") then error() end
    if (type(a_tblNumberMultiMap.m_tblPairs) ~= "table") then error() end


    local tblNumberMap = new_TNumberMapFromTNumberMultiMap(a_tblNumberMultiMap)

    if (#tblNumberMap.m_tblPairs == 0) then error() end

    local obj =
    {
      GetType    = GetType,
      m_tblPairs = tblNumberMap.m_tblPairs,
    }

    if (g_bIsDebug) then PresentString("-new_TNumberFunction") end
    return obj
  end
end



-- ===========================================================================
-- Class TPolynomialInterpolator
--
-- This class encapsulates a policy of polynomial interpolation over a table
-- of pairs.  The table can be of any size greater than two.
-- ===========================================================================
do

-- ---------------------------------------------------------------------------
-- Method Initialize
--
-- This method computes the coefficients of the interpolating polynomial.
-- ---------------------------------------------------------------------------
  local function Initialize(self)
    if (g_bIsDebug) then PresentString("+TPolynomialInterpolator:Initialize") end

    for nIndex,tblPair in ipairs(self.m_fcn.m_tblPairs) do
      table.insert(self.m_vecCoeff, tblPair.nValue)
    end

    local nN = #self.m_vecCoeff

    for nJ = 1, nN-1 do
      for nI = nN, nJ+1, -1 do
        self.m_vecCoeff[nI] = (self.m_vecCoeff[nI] - self.m_vecCoeff[nI-1]) / (self.m_fcn.m_tblPairs[nI].nKey - self.m_fcn.m_tblPairs[nI-nJ].nKey)
      end
    end

    if (g_bIsDebug) then PresentString("-TPolynomialInterpolator:Initialize") end
  end

-- ---------------------------------------------------------------------------
-- Method Interpolate
--
-- This method estimates the output of an unknown function with a given
-- input (a_nX).
-- ---------------------------------------------------------------------------
  local function Interpolate(self, a_nX)
    if (g_bIsDebug) then PresentString("+TPolynomialInterpolator:Interpolate(", a_nX, ")") end

    if (type(a_nX) ~= "number") then error() end

    local nN = #self.m_vecCoeff
    local nY = self.m_vecCoeff[nN]

    for nI = nN-1, 1, -1 do
      nY = nY * (a_nX - self.m_fcn.m_tblPairs[nI].nKey) + self.m_vecCoeff[nI]
    end

    if (g_bIsDebug) then PresentString("-TPolynomialInterpolator:Interpolate") end

    return nY
  end

-- ---------------------------------------------------------------------------
-- Method new_TPolynomialInterpolator
--
-- This method creates an object of this class.
-- ---------------------------------------------------------------------------
  function new_TPolynomialInterpolator(a_tblNumberFunction)
    if (g_bIsDebug) then PresentString("+new_TPolynomialInterpolator") end

    if (type(a_tblNumberFunction)         ~= "table")    then error() end
    if (type(a_tblNumberFunction.GetType) ~= "function") then error() end

    local strType = a_tblNumberFunction.GetType()

    if (type(strType) ~= "string")           then error() end
    if (strType       ~= "TNumberFunction")  then error() end
    if (#a_tblNumberFunction.m_tblPairs < 2) then error() end

    local obj =
    {
      Interpolate = Interpolate,
      m_fcn       = a_tblNumberFunction,
      m_vecCoeff  = {},
    }

    Initialize(obj)

    if (g_bIsDebug) then PresentString("-new_TPolynomialInterpolator") end
    return obj
  end
end



-- ===========================================================================
-- Class TLinearSplineInterpolator
--
-- This class encapsulates a policy of 1st degree spline interpolation over
-- a table of pairs.  The table can be of any size greater than two.
-- ===========================================================================
do
-- ---------------------------------------------------------------------------
-- Method Interpolate
--
-- This method estimates the output of an unknown function with a given
-- input (a_nX).
-- ---------------------------------------------------------------------------
  local function Interpolate(self, a_nX)
    if (g_bIsDebug) then PresentString("+TLinearSplineInterpolator:Interpolate(", a_nX, ")") end

    if (type(a_nX) ~= "number") then error() end

    local nN     = #self.m_fcn.m_tblPairs
    local nDiff  = 0
    local nIndex = 0
    local nSlope = 0
    local nY     = 0

    for nI = nN-1, 2, -1 do
      nDiff = a_nX - self.m_fcn.m_tblPairs[nI].nKey

      if (nDiff >= 0) then
        nIndex = nI
        break
      end
    end

    if (0 == nIndex) then
      nIndex = 1
      nDiff = a_nX - self.m_fcn.m_tblPairs[1].nKey
    end

    nSlope = (self.m_fcn.m_tblPairs[nIndex+1].nValue - self.m_fcn.m_tblPairs[nIndex].nValue) / (self.m_fcn.m_tblPairs[nIndex+1].nKey - self.m_fcn.m_tblPairs[nIndex].nKey)
    nY     = self.m_fcn.m_tblPairs[nIndex].nValue + nSlope * nDiff

    if (g_bIsDebug) then PresentString("-TLinearSplineInterpolator:Interpolate") end
    return nY
  end

-- ---------------------------------------------------------------------------
-- Method new_TLinearSplineInterpolator
--
-- This method creates an object of this class.
-- ---------------------------------------------------------------------------
  function new_TLinearSplineInterpolator(a_tblNumberFunction)
    if (g_bIsDebug) then PresentString("+new_TLinearSplineInterpolator") end

    if (type(a_tblNumberFunction)         ~= "table")    then error() end
    if (type(a_tblNumberFunction.GetType) ~= "function") then error() end

    local strType = a_tblNumberFunction.GetType()

    if (type(strType) ~= "string")           then error() end
    if (strType       ~= "TNumberFunction")  then error() end
    if (#a_tblNumberFunction.m_tblPairs < 2) then error() end

    local obj =
    {
      Interpolate = Interpolate,
      m_fcn       = a_tblNumberFunction,
    }

    if (g_bIsDebug) then PresentString("-new_TLinearSplineInterpolator") end
    return obj
  end
end

-- ===========================================================================
-- Class TQuadraticBSplineInterpolator
--
-- This class encapsulates a policy of quadratic B spline interpolation over
-- a table of pairs.  The table can be of any size greater than two.
-- ===========================================================================
do

-- ---------------------------------------------------------------------------
-- Method Initialize
--
-- This method computes the coefficients (m_vecCoeff) and
-- key differences (m_vecH) given a table of pairs.
-- ---------------------------------------------------------------------------
  local function Initialize(self)
    if (g_bIsDebug) then PresentString("+TQuadraticBSplineInterpolator:Initialize") end

    local nN = #self.m_fcn.m_tblPairs

    for nIndex,tblPair in ipairs(self.m_fcn.m_tblPairs) do
      table.insert(self.m_vecCoeff, 0.0)
      table.insert(self.m_vecH,     0.0)
    end

    table.insert(self.m_vecCoeff, 0.0)
    table.insert(self.m_vecH,     0.0)

    for nJ = 2, nN do
      self.m_vecH[nJ] = self.m_fcn.m_tblPairs[nJ].nKey - self.m_fcn.m_tblPairs[nJ-1].nKey
    end

    self.m_vecH[1]    = self.m_vecH[2]
    self.m_vecH[nN+1] = self.m_vecH[2]

    local nDelta = -1.0
    local nGamma = 2.0    * self.m_fcn.m_tblPairs[1].nValue
    local nP     = nDelta * nGamma
    local nQ     = 2.0
    local nRatio = 0.0

    for nI = 2, nN do
      nRatio = self.m_vecH[nI+1] / self.m_vecH[nI]
      nDelta = -1.0 * nRatio * nDelta
      nGamma = -1.0 * nRatio * nGamma + (nRatio + 1.0) * self.m_fcn.m_tblPairs[nI].nValue
      nP     = nP + (nDelta * nGamma)
      nQ     = nQ + (nDelta * nDelta)
    end

    self.m_vecCoeff[1] = -1.0 * nP / nQ
    nN                 = nN + 1.0

    for nK = 2, nN do
      self.m_vecCoeff[nK] = ((self.m_vecH[nK-1] + self.m_vecH[nK]) * self.m_fcn.m_tblPairs[nK-1].nValue - self.m_vecH[nK] * self.m_vecCoeff[nK-1]) / self.m_vecH[nK-1]
    end

    if (g_bIsDebug) then PresentString("-TQuadraticBSplineInterpolator:Initialize") end
  end

-- ---------------------------------------------------------------------------
-- Method Interpolate
--
-- This method estimates the output of an unknown function with a given
-- input (a_nX).
-- ---------------------------------------------------------------------------
  local function Interpolate(self, a_nX)
    if (g_bIsDebug) then PresentString("+TQuadraticBSplineInterpolator:Interpolate(", a_nX, ")") end

    if (type(a_nX) ~= "number") then error() end

    local nN  = #self.m_fcn.m_tblPairs
    local nC1 = 0.0
    local nC2 = 0.0
    local nJ  = 0.0
    local nY  = 0.0

    for nIndex = 2, nN do
      nJ = nIndex
      if (a_nX < self.m_fcn.m_tblPairs[nIndex].nKey) then
        break
      end
    end

    nC2 = self.m_vecCoeff[nJ+1] * (a_nX - self.m_fcn.m_tblPairs[nJ-1].nKey) + self.m_vecCoeff[nJ]*(self.m_fcn.m_tblPairs[nJ].nKey - a_nX + self.m_vecH[nJ+1])
    nC2 = nC2 / (self.m_vecH[nJ] + self.m_vecH[nJ+1])

    nC1 = self.m_vecCoeff[nJ] * (a_nX - self.m_fcn.m_tblPairs[nJ-1].nKey + self.m_vecH[nJ-1]) + self.m_vecCoeff[nJ-1] * (self.m_fcn.m_tblPairs[nJ-1].nKey - a_nX + self.m_vecH[nJ])
    nC1 = nC1 / (self.m_vecH[nJ-1] + self.m_vecH[nJ])

    nY = (nC2 * (a_nX - self.m_fcn.m_tblPairs[nJ-1].nKey) + nC1 * (self.m_fcn.m_tblPairs[nJ].nKey - a_nX)) / self.m_vecH[nJ]
    if (g_bIsDebug) then PresentString("-TQuadraticBSplineInterpolator:Interpolate") end

    return nY
  end

-- ---------------------------------------------------------------------------
-- Method new_TQuadraticBSplineInterpolator
--
-- This method creates an object of this class.
-- ---------------------------------------------------------------------------
  function new_TQuadraticBSplineInterpolator(a_tblNumberFunction)
    if (g_bIsDebug) then PresentString("+new_TQuadraticBSplineInterpolator") end

    if (type(a_tblNumberFunction)         ~= "table")    then error() end
    if (type(a_tblNumberFunction.GetType) ~= "function") then error() end

    local strType = a_tblNumberFunction.GetType()

    if (type(strType) ~= "string")           then error() end
    if (strType       ~= "TNumberFunction")  then error() end
    if (#a_tblNumberFunction.m_tblPairs < 2) then error() end

    local obj =
    {
      Interpolate = Interpolate,
      m_fcn       = a_tblNumberFunction,
      m_vecCoeff  = {},
      m_vecH      = {}
    }

    Initialize(obj)

    if (g_bIsDebug) then PresentString("-new_TQuadraticBSplineInterpolator") end
    return obj
  end
end



-- ===========================================================================
-- Class TCubicSplineInterpolator
--
-- This class encapsulates a policy of cubic spline interpolation over a table
-- of pairs.  The table can be of any size greater than two.
-- ===========================================================================
do

-- ---------------------------------------------------------------------------
-- Method Initialize
--
-- This method computes the coefficients of the interpolating polynomial.
-- ---------------------------------------------------------------------------
  local function Initialize(self)
    if (g_bIsDebug) then PresentString("+TCubicSplineInterpolator:Initialize") end

    local nN = #self.m_fcn.m_tblPairs

    for nI = 1, nN-1 do
      self.m_vecH[nI] =  self.m_fcn.m_tblPairs[nI+1].nKey   - self.m_fcn.m_tblPairs[nI].nKey
      self.m_vecB[nI] = (self.m_fcn.m_tblPairs[nI+1].nValue - self.m_fcn.m_tblPairs[nI].nValue) / self.m_vecH[nI]
      table.insert(self.m_vecU, 0.0)
      table.insert(self.m_vecV, 0.0)
      table.insert(self.m_vecZ, 0.0)
    end

    self.m_vecU[2] = 2.0 * (self.m_vecH[1] + self.m_vecH[2])
    self.m_vecV[2] = 6.0 * (self.m_vecB[2] - self.m_vecB[1])

    for nJ = 3, nN-1 do
      self.m_vecU[nJ] = 2.0 * (self.m_vecH[nJ] + self.m_vecH[nJ-1]) - (self.m_vecH[nJ-1] * self.m_vecH[nJ-1]) / self.m_vecU[nJ-1]
      self.m_vecV[nJ] = 6.0 * (self.m_vecB[nJ] - self.m_vecB[nJ-1]) - (self.m_vecH[nJ-1] * self.m_vecV[nJ-1]) / self.m_vecU[nJ-1]
    end

    self.m_vecZ[nN] = 0.0

    for nK = nN-1, 2, -1 do
      self.m_vecZ[nK] = (self.m_vecV[nK] - self.m_vecH[nK] * self.m_vecZ[nK+1]) / self.m_vecU[nK]
    end

    self.m_vecZ[1] = 0.0

    if (g_bIsDebug) then PresentString("-TCubicSplineInterpolator:Initialize") end
  end

-- ---------------------------------------------------------------------------
-- Method Interpolate
--
-- This method estimates the output of an unknown function with a given
-- input (a_nX).
-- ---------------------------------------------------------------------------
  local function Interpolate(self, a_nX)
    if (g_bIsDebug) then PresentString("+TCubicSplineInterpolator:Interpolate(", a_nX, ")") end

    if (type(a_nX) ~= "number") then error() end

    local nN    = #self.m_fcn.m_tblPairs
    local nDiff = 0.0
    local nI    = 0.0

    for nIndex = nN-1, 2, -1 do
      nI    = nIndex
      nDiff = a_nX - self.m_fcn.m_tblPairs[nIndex].nKey

      if (nDiff >= 0.0) then
        break
      end
    end

    if (nDiff < 0.0) then
      nI = 1.0
      nDiff = a_nX - self.m_fcn.m_tblPairs[nI].nKey
    end

    local nH = 0.0
    local nB = 0.0
    local nP = 0.0
    local nY = 0.0

    nH = self.m_fcn.m_tblPairs[nI+1].nKey - self.m_fcn.m_tblPairs[nI].nKey
    nB = (self.m_fcn.m_tblPairs[nI+1].nValue - self.m_fcn.m_tblPairs[nI].nValue) / nH - nH * (self.m_vecZ[nI+1] + 2.0 * self.m_vecZ[nI]) / 6.0
    nP = nB + nDiff * (0.5 * self.m_vecZ[nI] + nDiff*(self.m_vecZ[nI+1] - self.m_vecZ[nI]) / (6.0 * nH))
    nY = self.m_fcn.m_tblPairs[nI].nValue + nDiff * nP

    if (g_bIsDebug) then PresentString("-TCubicSplineInterpolator:Interpolate") end
    return nY
  end

-- ---------------------------------------------------------------------------
-- Method new_TCubicSplineInterpolator
--
-- This method creates an object of this class.
-- ---------------------------------------------------------------------------
  function new_TCubicSplineInterpolator(a_tblNumberFunction)
    if (g_bIsDebug) then PresentString("+new_TCubicSplineInterpolator") end

    if (type(a_tblNumberFunction)         ~= "table")    then error() end
    if (type(a_tblNumberFunction.GetType) ~= "function") then error() end

    local strType = a_tblNumberFunction.GetType()

    if (type(strType) ~= "string")           then error() end
    if (strType       ~= "TNumberFunction")  then error() end
    if (#a_tblNumberFunction.m_tblPairs < 2) then error() end

    local obj =
    {
      Interpolate = Interpolate,
      m_fcn       = a_tblNumberFunction,
      m_vecH      = {},
      m_vecB      = {},
      m_vecU      = {},
      m_vecV      = {},
      m_vecZ      = {},
    }

    Initialize(obj)

    if (g_bIsDebug) then PresentString("-new_TCubicSplineInterpolator") end
    return obj
  end
end


-- ===========================================================================
-- Main Program
--
-- This script estimates y = F(x) such that F(x) = x * x for x = 1, 2, 3
--
-- let P(x) = c0 + c1(x - x0) + c2(x - x0)(x - x1) where
--
-- x | 1.0 | 2.0 | 3.0
-- --|-----|-----|-----
-- y | 1.0 | 4.0 | 9.0
--
-- C0 = y0
-- c1 = (y1 - c0) / (x1 - x0)
-- c2 = (y2 - c0 - c1(x2 - x0)) / (x2 - x0)(x2 - x1))
--
--
-- x     F(x)  P(x)  Residual
-- ------------------------------
-- 1.00  1.00  1.00   0.00
-- 2.00  4.00  4.00   0.00
-- 3.00  9.00  9.00   0.00
-- 1.50  2.25  2.25   0.00
-- ===========================================================================
do
  local nY                = 0.0
  local tblNumberMultiMap = new_TNumberMultiMap()

  tblNumberMultiMap:Add(1.0, 1.0)
  tblNumberMultiMap:Add(2.0, 4.0)
  tblNumberMultiMap:Add(3.0, 9.0)

  local tblNumberFunction = new_TNumberFunction(tblNumberMultiMap)

  pi  = new_TPolynomialInterpolator(tblNumberFunction)

  for nI = 1, 3 do
    nY = pi:Interpolate(nI)
    PresentString(nY)
  end

  nY = pi:Interpolate(1.5)
  PresentString(nY)

  lsi = new_TLinearSplineInterpolator(tblNumberFunction)

  for nI = 1, 3 do
    nY = lsi:Interpolate(nI)
    PresentString(nY)
  end

  nY = lsi:Interpolate(1.5)
    PresentString(nY)

-- Not sure qbsi:Interpolate works properly.
  qbsi = new_TQuadraticBSplineInterpolator(tblNumberFunction)

  for nI = 1, 3 do
    nY = qbsi:Interpolate(nI)
    PresentString(nY)
  end

  nY = qbsi:Interpolate(1.5)
    PresentString(nY)

  csi = new_TCubicSplineInterpolator(tblNumberFunction)

  for nI = 1, 3 do
    nY = csi:Interpolate(nI)
    PresentString(nY)
  end

  nY = csi:Interpolate(1.5)
    PresentString(nY)


  matA = new_TNumberMatrix(4,4)

  for   nRow = 1, #matA.m_tblIndex    do
    for nCol = 1, #matA.m_tblIndex[1] do
      PresentString(nRow, nCol, matA.m_tblPairs[matA.m_tblIndex[nRow][nCol]].nValue)
    end
  end

  matA:SetValue(1, 1,   3)
  matA:SetValue(1, 2, -13)
  matA:SetValue(1, 3,   9)
  matA:SetValue(1, 4,   3)
  matA:SetValue(2, 1,  -6)
  matA:SetValue(2, 2,   4)
  matA:SetValue(2, 3,   1)
  matA:SetValue(2, 4, -18)
  matA:SetValue(3, 1,   6)
  matA:SetValue(3, 2,  -2)
  matA:SetValue(3, 3,   2)
  matA:SetValue(3, 4,   4)
  matA:SetValue(4, 1,  12)
  matA:SetValue(4, 2,  -8)
  matA:SetValue(4, 3,   6)
  matA:SetValue(4, 4,  10)


  PresentString("Matrix A")

  for   nRow = 1, #matA.m_tblIndex    do
    for nCol = 1, #matA.m_tblIndex[1] do
      PresentString(nRow, nCol, matA.m_tblPairs[matA.m_tblIndex[nRow][nCol]].nValue)
    end
  end

  PresentString("")


  matB = new_TNumberMatrix(4,1)

  matB:SetValue(1, 1, -19)
  matB:SetValue(2, 1, -34)
  matB:SetValue(3, 1,  16)
  matB:SetValue(4, 1,  26)

  PresentString("Matrix B")

  for   nRow = 1, #matB.m_tblIndex    do
    for nCol = 1, #matB.m_tblIndex[1] do
      PresentString(nRow, nCol, matB.m_tblPairs[matB.m_tblIndex[nRow][nCol]].nValue)
    end
  end

  PresentString("")

  matAlgebra = new_TNumberMatrixAlgebra()

  matX = matAlgebra.Solve(matA, matB)

  PresentString("Matrix X")

  for   nRow = 1, #matX.m_tblIndex    do
    for nCol = 1, #matX.m_tblIndex[1] do
      PresentString(nRow, nCol, matX.m_tblPairs[matX.m_tblIndex[nRow][nCol]].nValue)
    end
  end

  -- -----------------------------------------------------------------------
  --                                    Barrel
  --                      Mass  Length  Length
  -- Pistol                (g)   (mm)    (mm)    Capacity   LN(Price ($))
  -- -----------------------------------------------------------------------
  -- 9mm Walther P99       700    180    102        16           6.477
  -- 0.45 ACP HK USP       748    194    108        12           6.685
  -- 0.45 ACP Colt 1911A1 1100    210    127         8           6.685
  -- 9mm Berretta 92FS     945    217    125        10           6.477
  -- 9mm Sig Arms P226     964    196    112        15           6.745
  -- 0.50 AE Desert Eagle 2024    273    152         7           7.131
  -- -----------------------------------------------------------------------
  matPistols = new_TNumberMatrix(6, 5)

  matPistols:SetValue(1, 1, 700)
  matPistols:SetValue(1, 2, 180)
  matPistols:SetValue(1, 3, 102)
  matPistols:SetValue(1, 4, 16)
  matPistols:SetValue(1, 5, 6.477)

  matPistols:SetValue(2, 1, 748)
  matPistols:SetValue(2, 2, 194)
  matPistols:SetValue(2, 3, 108)
  matPistols:SetValue(2, 4, 12)
  matPistols:SetValue(2, 5, 6.685)

  matPistols:SetValue(3, 1, 1100)
  matPistols:SetValue(3, 2, 210)
  matPistols:SetValue(3, 3, 127)
  matPistols:SetValue(3, 4, 8)
  matPistols:SetValue(3, 5, 6.685)

  matPistols:SetValue(4, 1, 945)
  matPistols:SetValue(4, 2, 217)
  matPistols:SetValue(4, 3, 125)
  matPistols:SetValue(4, 4, 10)
  matPistols:SetValue(4, 5, 6.477)

  matPistols:SetValue(5, 1, 964)
  matPistols:SetValue(5, 2, 196)
  matPistols:SetValue(5, 3, 112)
  matPistols:SetValue(5, 4, 15)
  matPistols:SetValue(5, 5, 6.745)

  matPistols:SetValue(6, 1, 2024)
  matPistols:SetValue(6, 2, 273)
  matPistols:SetValue(6, 3, 152)
  matPistols:SetValue(6, 4, 7)
  matPistols:SetValue(6, 5, 7.131)


  mlrPistols = new_TMultipleLinearRegressionEstimator(matPistols)

  local nPrice = 0
  local tblInputs = {700, 180, 102, 16}

  nPrice = mlrPistols:Estimate(tblInputs)
  print("9mm Walther P99      Price=", math.exp(nPrice))

  tblInputs = {748, 194, 108, 12}
  nPrice = mlrPistols:Estimate(tblInputs)
  print("0.45 ACP HK USP      Price=", math.exp(nPrice))

  tblInputs = {1100, 210, 127, 8}
  nPrice = mlrPistols:Estimate(tblInputs)
  print("0.45 ACP Colt 1911A1 Price=", math.exp(nPrice))

  tblInputs = {945, 217, 125, 10}
  nPrice = mlrPistols:Estimate(tblInputs)
  print("9mm Berretta 92FS    Price=", math.exp(nPrice))

  tblInputs = {964, 196, 112, 15}
  nPrice = mlrPistols:Estimate(tblInputs)
  print("9mm Sig Arms P226    Price=", math.exp(nPrice))

  tblInputs = {2024, 273, 152, 7}
  nPrice = mlrPistols:Estimate(tblInputs)
  print("0.50 AE Desert Eagle Price=", math.exp(nPrice))

  matD = new_TNumberMatrix(2, 2)
  matD:SetValue(1, 1, 1)
  matD:SetValue(1, 2, 3)
  matD:SetValue(2, 1, 3)
  matD:SetValue(2, 2, 4)
  nDet = matD:GetDeterminantOf2x2Matrix()
  print ("Determinant 1 * 4 - 3 * 3 = ", nDet)
end
