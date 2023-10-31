class Lexer
  def initialize(source)
      @source = source
  end

  def lex
    @i = 0
    @tokens = []
    @token_so_far = ''
    while @i < @source.length
      if has_digit
        while has_digit
          capture
        end
        if has(".")
          capture
          while has_digit
            capture
          end
        end
        emit_token(:number)
      elsif has_letter
        while has_letter || has_digit
          capture
        end
        case @token_so_far
        when "True"
          emit_token(:true_literal)
        when "False"
          emit_token(:false_literal)
        when "Nil"
          emit_token(:nil_literal)
        else
          emit_token(:identifier)
        end
      elsif has('+')
        capture
        emit_token(:plus)
      elsif has('-')
        capture
        emit_token(:hyphen)
      elsif has('*')
        capture
        emit_token(:asterisk)
      elsif has('/')
        capture
        emit_token(:slash)
      elsif has('^')
        capture
        emit_token(:caret)
      elsif has('<')
        capture
        if has('=')
          capture
          emit_token(:less_than_or_equal)
        else
          emit_token(:less_than)
        end
      elsif has('>')
        capture
        if has('=')
          capture
          emit_token(:greater_than_or_equal)
        else
          emit_token(:greater_than)
        end
      elsif has('=')
        capture
        if has('=')
          capture
          emit_token(:equal)
        else
          raise "Single '=' found. Expected '=='."
        end
      elsif has('!')
        capture
        if has('=')
          capture
          emit_token(:not_equal)
        else
          emit_token(:not)
        end
      elsif has('&')
        capture
        if has('&')
          capture
          emit_token(:and)
        else
          raise "Single '&' found. Expected '&&'."
        end
      elsif has('|')
        capture
        if has('|')
          capture
          emit_token(:or)
        else
          raise "Single '|' found. Expected '||'."
        end
      elsif has('(')
        capture
        emit_token(:left_parenthesis)
      elsif has(')')
        capture
        emit_token(:right_parenthesis)
      elsif has(' ')
        @i += 1
        @token_so_far = ''
      else
        raise "Bad Character at position #{@i}: #{@source[@i]}"
      end
    end
  
    @tokens
  end
  

  def capture
      @token_so_far += @source[@i]
      @i += 1
  end

  def emit_token(type)
      @tokens.push({type: type, source: @token_so_far})
      @token_so_far = ''
  end

  def has(character)
      @i < @source.length && @source[@i] == character
  end

  def has_digit
      @i < @source.length && '0' <= @source[@i] && @source[@i] <= '9'
  end

  def has_letter
      @i < @source.length && (('a' <= @source[@i] && @source[@i] <= 'z') || ('A' <= @source[@i] && @source[@i] <= 'Z'))
  end
end
